require 'selenium-webdriver'

UIAUTO_LOCATOR_PREFIX = 'UIATarget.localTarget().frontMostApp().mainWindow()'

module Quto
  module Drivers
    class BaseDriver

      # TODO: why do I need this?
      attr_reader :config

      # def desired_caps; end

      def find(locator)
        how = locator.keys[0].to_sym
        what = prepare_locator(how, locator[how])

        begin
          appium.find_element(how, what)
        rescue Selenium::WebDriver::Error::NoSuchElementError
          return nil
        end
      end

      # TODO: get rid of copy-paste code
      def find_all(locator)
        how = locator.keys[0].to_sym
        what = locator[how]

        begin
          appium.find_elements(how, what)
        rescue Selenium::WebDriver::Error::NoSuchElementError
          return nil
        end
      end

      def hide_keyboard(hide_key = nil)
        appium.hide_keyboard(hide_key)
      end

      def exists?(locator)
        not find(locator).nil?
      end

      def enabled?(locator)
        element = find(locator)
        return false if element.nil?
        element.enabled?
      end

      def displayed?(locator)
        element = find(locator)
        return false if element.nil?
        element.displayed?
      end

      def click(locator)
        find(locator).click
      end

      def long_tap(locator)
        # TODO: implement long tap
      end

      def type(keys, locator)
        element = find(locator)
        element.type(keys)
      end

      def text(locator)
        find(locator).text
      end

      def name(locator)
        find(locator).name
      end

      def start
        initialize_driver
      end

      def quit
        @appium_driver.driver_quit
      end

      private

      def appium
        @appium_driver || initialize_driver
      end

      def initialize_driver
        @appium_driver = Appium::Driver.new(desired_caps)
        @appium_driver.start_driver
      end

      def prepare_locator locator_type, locator_string
        locator_type == :uiautomation ? (UIAUTO_LOCATOR_PREFIX + locator_string) : locator_string
      end
    end
  end
end