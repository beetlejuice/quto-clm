Before do |scenario|

  tags = scenario.source_tag_names

  # $current_profile = nil # depends on how to start tests - with pre-logined or not
  $current_profile = 'mr'
  feature_profile = profile_from_tags(tags)

  is_profile_changed = $current_profile != feature_profile
  is_clean = $current_profile && is_profile_changed

  prepare_driver(is_clean)
  setup_user_with_profile(feature_profile) if (is_profile_changed || not_logged_in?)
end

After do
  $quto.quit
end

def profile_from_tags(tags)
  # TODO: extract profile names to constants (ALL_PROFILES and DEFAULT_PROFILE)
  profiles = %w(mr rm tkam ckam)
  (tags & profiles).first || 'mr'
end

def not_logged_in?
  wait_true(timeout = 3){ login_screen_on? }
end

def login_screen_on?
  !driver.find(:uiautomation => ".mainWindow().navigationBars().firstWithPredicate(\"name CONTAINS 'Log In'\")").nil?
end

def prepare_driver(is_clean)
  $quto = Quto::DriverDesigner.create_driver(is_clean)
  $quto.start
end

def setup_user_with_profile(profile)
  login_with_profile(profile)
  $current_profile = profile
end

def login_with_profile(profile)
  steps %{When I login with #{profile} user}
end