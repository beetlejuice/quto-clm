require 'quto/accessors/view'

module Quto
  module Accessors
    class Table < View
      def initialize(locator)
        @locator = locator
      end

      def locator
        @locator
      end
    end
  end
end