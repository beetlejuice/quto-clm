require 'quto'

TITLE_LOCATOR_TEMPLATE = ".navigationBar().staticTexts()['%s']"

class BaseScreen
  include Quto

  attr_accessor :title

  def self.create_for_profile(profile)
    screen_name = profile + self.name
    Object.const_get(screen_name).new
  end

  def active?
    enabled_after_wait?(label_element(title_locator))
  end

  def title_locator
    title_locator_string = TITLE_LOCATOR_TEMPLATE % title
    {:uiautomation => title_locator_string}
  end
end