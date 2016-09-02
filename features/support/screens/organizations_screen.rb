require_relative 'organization_type_popover'
require_relative 'tab_bar'

# Permanent elements
ORGANIZATIONS_FILTER_BUTTON_LOCATOR = {:uiautomation => ".navigationBar().buttons().firstWithPredicate(\"name CONTAINS '▼'\")"}
TITLE_LOCATOR = {:uiautomation => ".navigationBar().staticTexts()['Организации']"}
MENU_BUTTON_LOCATOR = {:uiautomation => ".navigationBar().buttons()['Меню']"}
ORGANIZATIONS_LIST_LOCATOR = {:uiautomation => ".tableViews()[0]"}

# Appearing elements
FILTER_LIST_LOCATOR = ""
MAIN_MENU_LOCATOR = ""

class OrganizationsScreen
  include Quto

  button('menu_button', MENU_BUTTON_LOCATOR)
  button('organizations_filter_button', ORGANIZATIONS_FILTER_BUTTON_LOCATOR)
  table('organizations_list', ORGANIZATIONS_LIST_LOCATOR)
  screen_section('organization_type_popover', OrganizationTypePopover) # this looks awful
  screen_section('tab_bar', TabBar)

  def list_pharmacies
    select_filter 'Все аптеки'
  end

  def start_creating_organization type
    pick_menu_option('Добавить организацию')
    organization_type_popover.select_organization_type type
  end

  def active?
    enabled_after_wait?(label_element(TITLE_LOCATOR))
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