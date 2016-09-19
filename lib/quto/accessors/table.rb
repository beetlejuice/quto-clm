module Quto
  module Accessors
    class Table < View
      def [](idx)
        table_cells[idx]
      end

      # TODO: change to tap_cell with auto identification of parameter type
      def tap_cell_by_label(label)
        tap_cell({kind: :by_label, value: label})
      end

      def tap_cell_by_index(index)
        tap_cell({kind: :by_index, value: index})
      end

      def tap_button_on_cell_by_label(cell_label, button_label)
        tap_button_on_cell({kind: :by_label, value: cell_label}, button_label)
      end

      def tap_button_on_cell_by_index(cell_index, button_label)
        tap_button_on_cell({kind: :by_index, value: cell_index}, button_label)
      end

      def table_cells
        # return array of TableCells
      end

      def count
        # now only visible, do I need all?
        cells_locator_string = locator_string + '.visibleCells()'
        driver.find_all(:uiautomation => cells_locator_string).size
      end

      private

      def tap_cell(locator_settings)
        cell_locator = get_cell_locator locator_settings
        cell = Quto::Accessors::TableCell.new(cell_locator)
        scroll_to_cell(cell) unless cell.displayed?
        cell.click
      end

      def tap_button_on_cell(cell_locator_settings, button_label)
        cell_locator = get_cell_locator cell_locator_settings
        cell = Quto::Accessors::TableCell.new(cell_locator)
        scroll_to_cell(cell) unless cell.displayed?
        button_cell_locator = get_button_on_cell_locator(cell_locator_settings, button_label)
        Quto::Accessors::View.new(button_cell_locator).click
      end

      def scroll_to_cell(cell)
        driver.scroll_to(cell.locator)
      end

      def get_cell_locator(locator_settings)
        {:uiautomation => cell_locator_string(locator_settings)}
      end

      def get_button_on_cell_locator(cell_locator_settings, button_label)
        button_locator_string = cell_locator_string(cell_locator_settings) + ".buttons()[\"#{button_label}\"]"
        {:uiautomation => button_locator_string}
      end

      def locator_string
        locator[:uiautomation]
      end

      def cell_locator_string(locator_settings)
        variable_kind = locator_settings[:kind]
        variable_value = locator_settings[:value]
        case variable_kind
          when :by_label
            locator_string + ".cells().firstWithPredicate(\"ANY staticTexts.name CONTAINS '#{variable_value.to_s}'\")"
          when :by_index
            locator_string + ".cells()[#{variable_value.to_i}]"
          else
            raise "Unknown variable kind for cell locator: #{variable_kind}"
        end
      end
    end
  end
end