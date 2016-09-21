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

require 'generic_screen'
require 'navigatable_screen'
require 'generic_section'
require 'authorization_request_screen'
require 'contacts_sections/filters_popover'
require 'general_sections/tab_bar'
require 'contacts_screen'
require 'contact_screen'
require 'home_screen'
require 'login_screen'
require 'medical_visit_screen'
require 'organizations_sections/organization_type_popover'
require 'organizations_screen'
require 'pharmacy_visit_screen'
require 'visits_screen'

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