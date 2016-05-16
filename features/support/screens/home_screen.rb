require 'quto'

class HomeScreen < BaseScreen
  include Quto
end

class MRHomeScreen < HomeScreen
  button('calendar_button', :uiautomation => '')
  button('visits_button', :uiautomation => '')
  button('contacts_button', :uiautomation => '')
  button('organizations_button', :uiautomation => '')
  button('events_button', :uiautomation => '')
  button('messages_button', :uiautomation => '')
  button('presentations_button', :uiautomation => '')
  button('library_button', :uiautomation => '')
end

class RMHomeScreen < HomeScreen
  button('calendar_button', :uiautomation => '')
  button('contacts_button', :uiautomation => '')
  button('organizations_button', :uiautomation => '')
  button('employees_button', :uiautomation => '')
  button('events_button', :uiautomation => '')
  button('messages_button', :uiautomation => '')
  button('presentations_button', :uiautomation => '')
  button('library_button', :uiautomation => '')
end

class TKAMHomeScreen < HomeScreen
  button('visits_button', :uiautomation => '')
  button('contacts_button', :uiautomation => '')
  button('organizations_button', :uiautomation => '')
  button('messages_button', :uiautomation => '')
  button('presentations_button', :uiautomation => '')
  button('library_button', :uiautomation => '')
end

class CKAMHomeScreen < HomeScreen
  button('calendar_button', :uiautomation => '')
  button('contacts_button', :uiautomation => '')
  button('organizations_button', :uiautomation => '')
  button('messages_button', :uiautomation => '')
  button('presentations_button', :uiautomation => '')
  button('library_button', :uiautomation => '')
end