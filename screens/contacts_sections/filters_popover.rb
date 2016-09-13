class FiltersPopover < GenericSection
  FILTERS_TABLE_LOCATOR = '.tableViews()[0]'

  def self.locator_string
    '.mainWindow().popovers()[0]'
  end

  table('filters_table', :uiautomation => locator_string + FILTERS_TABLE_LOCATOR)

  def select_option(filter_name)
    filters_table.tap_cell_by_label(filter_name)
  end
end