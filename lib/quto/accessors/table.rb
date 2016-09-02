require 'quto/accessors/view'

LOCATOR = ""

module Quto
  module Accessors
    class Table < View

      def [](idx)
        table_cells
      end

      def select_cell_by_label label
        scroll_to_cell_by_label(label) # if !label.visible?
        table_cell_element(LOCATOR).click # TODO: LOCATOR
      end

      def scroll_to_cell_by_label label
        # TODO: implement
      end

      private

      def table_cells
      #   return array of TableCells
      end
    end
  end
end