require 'quto/accessors/view'

# LOCATOR = ""

module Quto
  module Accessors
    class Table < View

      def [](idx)
        table_cells[idx]
      end

      def pick

      end

      def tap_cell cell_label
        scroll_to_cell_by_label(label) # if !label.visible?
        table_cell_element(LOCATOR).click # TODO: LOCATOR
      end

      def tap_element_on_cell cell_label, element_label

      end

      def scroll_to_cell cell_label
        # TODO: implement
      end

      def table_cells
      #   return array of TableCells
      end
    end
  end
end