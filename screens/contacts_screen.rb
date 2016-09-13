class ContactsScreen < NavigatableScreen
  # Permanent elements
  CONTACTS_TABLE_LOCATOR = {:uiautomation => '.mainWindow().tableViews()[0]'}
  CONTACTS_FILTER_BUTTON_LOCATOR = {:uiautomation => ".mainWindow().navigationBar().buttons().firstWithPredicate(\"name CONTAINS '▼'\")"}
  MENU_BUTTON_LOCATOR = {:uiautomation => ".mainWindow().navigationBar().buttons()['Меню']"}

  # Appearing elements

  table('contacts_table', CONTACTS_TABLE_LOCATOR)
  button('menu_button', MENU_BUTTON_LOCATOR)
  button('contacts_filter_button', CONTACTS_FILTER_BUTTON_LOCATOR)
  screen_section('filters_popover', FiltersPopover)
  screen_section('tab_bar', TabBar)

  def title
    'Контакты'
  end

  def create_visit_to_contact(contact_name)
    contacts_table.tap_button_on_cell_by_label(contact_name, 'Создать')
  end

  def create_visit_to_random_contact
    random_cell_index = rand(contacts_table.count)
    contacts_table.tap_button_on_cell_by_index(random_cell_index, 'Создать')
  end

  def get_contact_name(contact_cell_data)
    # TODO: implement or remove
  end

  def use_filter(filter_name)
    contacts_filter_button_click
    filters_popover.select_option(filter_name)
  end
end