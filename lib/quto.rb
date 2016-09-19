require 'quto/dynamic_locators'
require 'quto/accessors/accessors'
require 'quto/accessors/view'
require 'quto/accessors/table'
require 'quto/accessors/table_cell'
require 'quto/navigation'
require 'quto/waiter'

module Quto

  WAIT_TIMEOUT = 5

  def self.included(cls)
    cls.extend(Quto::Accessors)
    cls.include(Quto::DynamicLocators)
  end

  def find(locator)
    driver.find(locator)
  end

  def find_all(locator)
    driver.find_all(locator)
  end

  def _find_with_wait(locator)
    el = nil
    wait_true do
      el = driver.find(locator)
      !el.nil?
    end
    el
  end

  def _click_with_wait(locator)
    _find_with_wait(locator).click
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

  # TODO: not sure if need this - better handle implicit wait on element find
  def view_after_wait(view, condition, timeout = 5)
    view if wait_until_condition(view, condition, timeout)
  end

  # TODO: looks overcomplicated, needs refactoring
  def wait_until_condition(view, condition = {}, timeout)
    action = condition[:action]
    expectation = condition.fetch(:expectation, true)

    wait = Quto::Waiter.new(:timeout => timeout)
    wait.until(expectation){ view.send(action) }
  end

  def wait_true(timeout = WAIT_TIMEOUT, &block)
    wait = Quto::Waiter.new(:timeout => timeout)
    wait.until(&block)
  end
end