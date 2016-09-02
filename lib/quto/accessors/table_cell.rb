require 'quto/accessors/view'

module Quto
  module Accessors
    class TableCell < View

      attr_accessor :parent_table

      def locator
        @locator.keys[0] == :uiautomation ? owner_table_locator + @locator : @locator
      end

      private

      def parent_table_locator
        @parent_table.locator
      end
    end
  end
end