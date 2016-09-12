Before do |scenario|

  tags = scenario.source_tag_names

  # $current_profile = nil
  $current_profile = 'mr'
  feature_profile = profile_from_tags(tags)

  is_profile_changed = $current_profile != feature_profile
  is_clean = $current_profile && is_profile_changed

  prepare_driver(is_clean)
  setup_user_with_profile(feature_profile) if is_profile_changed
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

def login_with_profile(profile)
  # TODO: deal with double quotes added during string interpolation
  # steps %{When I login with #{profile} user}
end