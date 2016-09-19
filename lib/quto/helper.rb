# Unused module
module Quto
  module Helper
    def click_keyboard_button(button)
      driver.click(:uiautomation => ".keyboard().elements()[\"#{button}\"]")
    end
  end
end