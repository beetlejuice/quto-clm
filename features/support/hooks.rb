Before do |scenario|
  tags = scenario.source_tag_names

  $current_profile = 'mr' # TODO: it is set before each scenario - should be redesigned
  $feature_profile = profile_from_tags(tags)

  prepare_driver(is_clean?)
  prepare_app_for_tests
end

After do
  $quto.quit
end

def is_profile_changed?
  $current_profile != $feature_profile
end

def is_clean?
  $current_profile && is_profile_changed?
end

def profile_from_tags(tags)
  # TODO: extract profile names to constants (ALL_PROFILES and DEFAULT_PROFILE)
  profiles = %w(mr rm tkam ckam)
  (tags & profiles).first || 'mr'
end

def prepare_driver(is_clean)
  $quto = Quto::DriverDesigner.create_driver(is_clean)
  if is_clean
    $logged_in = false
    $synchronized = false
  end
  $quto.start
end

def prepare_app_for_tests
  setup_user_with_profile($feature_profile) if (is_profile_changed? || not_logged_in?)
  wait_for_sync unless $synchronized
  $synchronized = true # first sync should be passed if we got here
  dismiss_sync_notification
end

def setup_user_with_profile(profile)
  login_with_profile(profile)
  $logged_in = true
  $current_profile = profile
end

def login_with_profile(profile)
  steps %{When I login with #{profile} user}
end

def not_logged_in?
  return false if $logged_in
  if login_screen_appeared?
    return true
  else
    $logged_in = true
    return false
  end
end

def login_screen_appeared?
  login_screen_bar_locator = {:uiautomation => ".mainWindow().navigationBars().firstWithPredicate(\"name CONTAINS 'Log In'\")"}
  displayed_locator_after_wait?(login_screen_bar_locator)
end

def dismiss_sync_notification
  alert_button = find(:uiautomation => ".alert().buttons()[\"Отложить\"]")
  alert_button.click unless alert_button.nil?
end

def wait_for_sync
  sync_progress_indicator = find(:uiautomation => ".mainWindow().progressIndicators()[0]")
  if !!sync_progress_indicator
    hidden_after_wait?(sync_progress_indicator, 600)
    $synchronized = true
  end
end