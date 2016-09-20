$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../', 'lib'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../', 'screens'))

require 'quto'
require 'appium_lib'
require 'rspec'
require 'quto/driver_designer'

require_relative 'custom_data'

World(CustomData)
World(Quto::Navigation)
World(Quto)

require '../../screens/generic_screen'
require '../../screens/navigatable_screen'
require '../../screens/generic_section'
require '../../screens/authorization_request_screen'
require '../../screens/contacts_sections/filters_popover'
require '../../screens/general_sections/tab_bar'
require '../../screens/contacts_screen'
require '../../screens/contact_screen'
require '../../screens/home_screen'
require '../../screens/login_screen'
require '../../screens/medical_visit_screen'
require '../../screens/organizations_sections/organization_type_popover'
require '../../screens/organizations_screen'
require '../../screens/pharmacy_visit_screen'
require '../../screens/visits_screen'

def driver
  $quto
end

# Extract to separate file
module Appium
  module Ios
    def hide_ios_keyboard close_key = 'Done'
      dismiss_keyboard = (<<-JS).strip
        if (!au.mainApp().keyboard().isNil()) {
          var key = au.mainApp().keyboard().buttons()['#{close_key}']
          if (key.isNil()) {
            var startY = au.mainApp().keyboard().rect().origin.y - 10;
            var endY = au.mainWindow().rect().size.height - 10;
            au.flickApp(0, startY, 0, endY);
          } else {
            key.tap();
          }
        }
      JS

      ignore do
        wait_true(5) do
          execute_script '!au.mainApp().keyboard().isNil()'
        end

        # dismiss keyboard
        execute_script dismiss_keyboard
      end

      # commented because never returns true after dismissing the keyboard
      # wait_true(5) do
      #   execute_script 'au.mainApp().keyboard().isNil()'
      # end
    end
  end
end