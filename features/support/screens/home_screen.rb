require 'quto'

class HomeScreen < BaseScreen
  include Quto

  def navigate_to_chapter chapter
    click_method = chapter.downcase + '_button_click'
    self.send(click_method)
  end
end

class MRHomeScreen < HomeScreen
  button('calendar_button', :uiautomation => '.buttons()[2]')
  button('visits_button', :uiautomation => '.buttons()[3]')
  button('contacts_button', :uiautomation => '.buttons()[4]')
  button('organizations_button', :uiautomation => '.buttons()[5]')
  button('events_button', :uiautomation => '.buttons()[6]')
  button('messages_button', :uiautomation => '.buttons()[7]')
  button('presentations_button', :uiautomation => '.buttons()[8]')
  button('library_button', :uiautomation => '.buttons()[9]')
end

class RMHomeScreen < HomeScreen
  button('calendar_button', :uiautomation => '.buttons()[2]')
  button('contacts_button', :uiautomation => '.buttons()[3]')
  button('organizations_button', :uiautomation => '.buttons()[4]')
  button('employees_button', :uiautomation => '.buttons()[5]')
  button('events_button', :uiautomation => '.buttons()[6]')
  button('messages_button', :uiautomation => '.buttons()[7]')
  button('presentations_button', :uiautomation => '.buttons()[8]')
  button('library_button', :uiautomation => '.buttons()[9]')
end

class TKAMHomeScreen < HomeScreen
  button('visits_button', :uiautomation => '.buttons()[2]')
  button('contacts_button', :uiautomation => '.buttons()[3]')
  button('organizations_button', :uiautomation => '.buttons()[4]')
  button('messages_button', :uiautomation => '.buttons()[5]')
  button('presentations_button', :uiautomation => '.buttons()[6]')
  button('library_button', :uiautomation => '.buttons()[7]')
end

class CKAMHomeScreen < HomeScreen
  button('calendar_button', :uiautomation => '.buttons()[2]')
  button('contacts_button', :uiautomation => '.buttons()[3]')
  button('organizations_button', :uiautomation => '.buttons()[4]')
  button('messages_button', :uiautomation => '.buttons()[5]')
  button('presentations_button', :uiautomation => '.buttons()[6]')
  button('library_button', :uiautomation => '.buttons()[7]')
end