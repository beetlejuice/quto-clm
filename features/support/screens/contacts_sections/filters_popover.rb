FILTERS_TABLE_LOCATOR = '.tableViews()[0]'

class FiltersPopover < BaseSection
  table('filters_table', :uiautomation => locator_string + FILTERS_TABLE_LOCATOR)

  def locator_string
    '.popovers()[0]'
  end

  def select_option(filter_name)
    filters_table.tap_cell(filter_name)
  end
end