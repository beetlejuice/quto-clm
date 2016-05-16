require_relative 'organization_type_popover'
require_relative 'tab_bar'

MAIN_MENU_LOCATOR = {:xpath => ""}
ORGANIZATIONS_FILTER_LOCATOR = {:xpath => ""}
ORGANIZATIONS_LIST_LOCATOR = {:xpath => ""}

class OrganizationsScreen
  include Quto

  button('menu_button', MAIN_MENU_LOCATOR)
  button('organizations_filter_button', ORGANIZATIONS_FILTER_LOCATOR)
  table('organizations_list', ORGANIZATIONS_LIST_LOCATOR)
  screen_section('organization_type_popover', OrganizationTypePopover)
  screen_section('tab_bar', TabBar)

  def start_creating_organization type
    pick_menu_option 'Добавить организацию'
    organization_type_popover.select_organization_type type
  end

  def active?
  end

  private

  def pick_menu_option option
    menu_button_click
    main_menu = table_element(:xpath => MAIN_MENU_LOCATOR)
    main_menu.select_cell_by_label option
  end
end