Before do |scenario|

  tags = scenario.source_tag_names

  $current_profile = 'mr'
  feature_profile = profile_from_tags(tags)

  is_profile_changed = $current_profile != feature_profile
  is_clean = $current_profile && is_profile_changed

  prepare_driver(is_clean)
  setup_user_with_profile(feature_profile) if (is_profile_changed || not_logged_in?)
  prepare_app_for_tests
end

After do
  $quto.quit
end

def profile_from_tags(tags)
  # TODO: extract profile names to constants (ALL_PROFILES and DEFAULT_PROFILE)
  profiles = %w(mr rm tkam ckam)
  (tags & profiles).first || 'mr'
end

def prepare_driver(is_clean)
  $quto = Quto::DriverDesigner.create_driver(is_clean)
  $quto.start
end

def setup_user_with_profile(profile)
  login_with_profile(profile)
  $current_profile = profile
end

def prepare_app_for_tests
  dismiss_sync_notification
  wait_for_sync
end

def login_with_profile(profile)
  steps %{When I login with #{profile} user}
end

def not_logged_in?
  login_screen_on?
end

def login_screen_on?
  login_screen_bar_locator = {:uiautomation => ".mainWindow().navigationBars().firstWithPredicate(\"name CONTAINS 'Log In'\")"}
  displayed_locator_after_wait?(login_screen_bar_locator)
end

def dismiss_sync_notification
  alert_button = _find_with_wait(:uiautomation => ".alert().buttons()[\"Отложить\"]")
  alert_button.click unless alert_button.nil?
end

def wait_for_sync
  sync_progress_indicator = _find_with_wait(:uiautomation => ".mainWindow().progressIndicators()[0]")
  if !!sync_progress_indicator
    hidden_after_wait?(sync_progress_indicator, 600)
  end
end