require_relative 'organization_type_popover'
require_relative 'general_sections/tab_bar'

# Permanent elements
ORGANIZATIONS_TABLE_LOCATOR = {:uiautomation => ".tableViews()[0]"}
ORGANIZATIONS_FILTER_BUTTON_LOCATOR = {:uiautomation => ".navigationBar().buttons().firstWithPredicate(\"name CONTAINS '▼'\")"}
MENU_BUTTON_LOCATOR = {:uiautomation => ".navigationBar().buttons()['Меню']"}

# Appearing elements
FILTER_LIST_LOCATOR = ""
MAIN_MENU_LOCATOR = ""

class OrganizationsScreen < BaseScreen
  button('menu_button', MENU_BUTTON_LOCATOR)
  button('organizations_filter_button', ORGANIZATIONS_FILTER_BUTTON_LOCATOR)
  table('organizations_table', ORGANIZATIONS_TABLE_LOCATOR)
  screen_section('organization_type_popover', OrganizationTypePopover) # TODO: separate screen section here looks awful
  screen_section('tab_bar', TabBar)

  def title
    'Организации'
  end

  def list_pharmacies
    select_filter 'Все аптеки'
  end

  def start_creating_organization type # TODO: refactor this method - ridiculous name
    pick_menu_option('Добавить организацию')
    organization_type_popover.select_organization_type type
  end

  private

  def select_filter filter_name
    organizations_filter_button_click
    table_element(:uiautomation => ".popovers()[0].tables()[0]").select_cell_by_label(filter_name)
  end

  def pick_menu_option option
    menu_button_click
    main_menu = table_element(:uiautomation => MAIN_MENU_LOCATOR)
    main_menu.select_cell_by_label option
  end
end