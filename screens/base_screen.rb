class BaseScreen
  include Quto

  TITLE_LOCATOR_TEMPLATE = ".navigationBar().staticTexts()['%s']"

  attr_accessor :title

  def self.create_for_profile(profile)
    screen_name = self.profiled? ? profile.upcase + self.name : self.name
    screen_name.to_class.new
  end

  def self.profiled?
    false
  end

  def active?
    enabled_after_wait?(label_element(title_locator))
  end

  def title_locator
    title_locator_string = TITLE_LOCATOR_TEMPLATE % title
    {:uiautomation => title_locator_string}
  end
end