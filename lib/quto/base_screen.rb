class BaseScreen
  def self.create_for_profile(profile)
    screen_name = profile + self.name
    Object.const_get(screen_name).new
  end
end