class BaseScreen
  def self.create_for_profile(profile)
    screen_name = profile + self.name
    screen_name.constantize.new
  end
end