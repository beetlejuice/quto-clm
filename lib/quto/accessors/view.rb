module Quto
  module Accessors
    class View
      def initialize(locator)
        @locator = locator
      end

      def locator
        @locator
      end

      def click
        driver.click(locator)
      end
      
      def long_tap
        driver.long_tap(locator)
      end

      def send_keys(keys)
        driver.type(keys, locator)
      end

      def exists?
        driver.exists?(locator)
      end

      def enabled?
        driver.enabled?(locator)
      end

      def displayed?
        driver.displayed?(locator)
      end

      def text
        driver.text(locator)
      end

      def name
        driver.name(locator)
      end
    end
  end
end