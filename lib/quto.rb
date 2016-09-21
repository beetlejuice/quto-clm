require 'quto/dynamic_locators'
require 'quto/accessors/accessors'
require 'quto/accessors/view'
require 'quto/accessors/table'
require 'quto/accessors/table_cell'
require 'quto/navigation'
require 'quto/waiter'

module Quto

  WAIT_TIMEOUT = 3

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

  def exists_after_wait?(view, timeout = WAIT_TIMEOUT)
    wait_true(timeout) { view.exists? }
  end

  def enabled_after_wait?(view, timeout = WAIT_TIMEOUT)
    wait_true(timeout) { view.enabled? }
  end

  def displayed_after_wait?(view, timeout = WAIT_TIMEOUT)
    wait_true(timeout) { view.displayed? }
  end

  def hidden_after_wait?(view, timeout = WAIT_TIMEOUT)
    wait_true(timeout) { !view.displayed? }
  end

  def exists_locator_after_wait?(locator, timeout = WAIT_TIMEOUT)
    view = Quto::Accessors::View.new(locator)
    exists_after_wait?(view, timeout)
  end

  def enabled_locator_after_wait?(locator, timeout = WAIT_TIMEOUT)
    view = Quto::Accessors::View.new(locator)
    enabled_after_wait?(view, timeout)
  end

  def displayed_locator_after_wait?(locator, timeout = WAIT_TIMEOUT)
    view = Quto::Accessors::View.new(locator)
    displayed_after_wait?(view, timeout)
  end

  def hidden_locator_after_wait?(locator, timeout = WAIT_TIMEOUT)
    view = Quto::Accessors::View.new(locator)
    hidden_after_wait?(view, timeout)
  end

  def wait_true(timeout = WAIT_TIMEOUT, &block)
    wait = Quto::Waiter.new(:timeout => timeout)
    wait.until(&block)
  end
end