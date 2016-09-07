require 'quto/accessors/accessors'
require 'quto/accessors/view'
# require 'quto/accessors/table'
# require 'quto/accessors/table_cell'
# require 'quto/dynamic_locators'
require 'quto/navigation'
require 'quto/helper'
require 'quto/waiter'
require 'quto/base_screen'
require 'quto/base_section'

module Quto

  def self.included(cls)
    cls.extend(Quto::Accessors)
    cls.include(Quto::Helper)
  end

  def find(locator)
    driver.find(locator)
  end

  def find_all(locator)
    driver.find_all(locator)
  end

  def exists_after_wait?(view, timeout = 5)
    wait_until_condition(view, {action: :exists?}, timeout)
  end

  def enabled_after_wait?(view, timeout = 5)
    wait_until_condition(view, {action: :enabled?}, timeout)
  end

  def displayed_after_wait?(view, timeout = 5)
    wait_until_condition(view, {action: :displayed?}, timeout)
  end

  def exists_locator_after_wait?(locator, timeout = 5)
    view = Quto::Accessors::View.new(locator)
    exists_after_wait?(view, timeout)
  end

  def enabled_locator_after_wait?(locator, timeout = 5)
    view = Quto::Accessors::View.new(locator)
    enabled_after_wait?(view, timeout)
  end

  def displayed_locator_after_wait?(locator, timeout = 5)
    view = Quto::Accessors::View.new(locator)
    displayed_after_wait?(view, timeout)
  end

  # TODO: not sure if need this
  def view_after_wait(view, condition, timeout = 5)
    view if wait_until_condition(view, condition, timeout)
  end

  def wait_until_condition(view, condition = {}, timeout)
    action = condition[:action]
    expectation = condition.fetch(:expectation, true)

    wait = Quto::Waiter.new(:timeout => timeout)
    wait.until(expectation){ view.send(action) }
  end
end