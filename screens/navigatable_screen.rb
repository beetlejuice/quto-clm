class NavigatableScreen < GenericScreen
  TITLE_LOCATOR_TEMPLATE = ".mainWindow().navigationBar().staticTexts()['%s']"

  attr_accessor :title

  def active?
    displayed_after_wait?(title_locator)
    # label_element(title_locator).displayed?
  end

  def title_locator
    title_locator_string = TITLE_LOCATOR_TEMPLATE % title
    {:uiautomation => title_locator_string}
  end
end