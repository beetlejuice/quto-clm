class GenericScreen
  include Quto

  def self.create_for_profile(profile)
    screen_name = self.profiled? ? profile.upcase + self.name : self.name
    screen_name.to_class.new
  end

  def self.profiled?
    false
  end
end