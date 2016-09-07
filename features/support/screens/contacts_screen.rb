require_relative 'general_sections/tab_bar'
require_relative 'contacts_sections/filters_popover'

# Permanent elements
CONTACTS_TABLE_LOCATOR = {:uiautomation => ".tableViews()[0]"}
CONTACTS_FILTER_BUTTON_LOCATOR = {:uiautomation => ".navigationBar().buttons().firstWithPredicate(\"name CONTAINS '▼'\")"}
MENU_BUTTON_LOCATOR = {:uiautomation => ".navigationBar().buttons()['Меню']"}

# Appearing elements

class ContactsScreen < BaseScreen
  table('contacts_table', CONTACTS_TABLE_LOCATOR)
  button('menu_button', MENU_BUTTON_LOCATOR)
  button('contacts_filter_button', CONTACTS_FILTER_BUTTON_LOCATOR)
  screen_section('filters_popover', FiltersPopover)
  screen_section('tab_bar', TabBar)

  def title
    'Контакты'
  end

  def create_visit_to_contact contact_name
    contacts_table.tap_element_on_cell(contact_name, 'Создать')
  end

  def create_visit_to_random_contact
    random_contact_name = get_contact_name(contacts_table.sample)
    create_visit_to_contact random_contact_name
  end

  def get_contact_name contact_cell_data
    # TODO: implement
  end

  # def show_doctors
  #   choose_filter('Все врачи')
  # end
  #
  # def show_pharmacists
  #   choose_filter('Все фармацевты')
  # end

  def use_filter(filter_name)
    contacts_filter_button_click
    filters_popover.select_option(filter_name)
  end
end