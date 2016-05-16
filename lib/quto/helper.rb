module Quto
  module Helper
    def hide_keyboard(hide_key = nil)
      driver.hide_keyboard(hide_key)
    end

    def click_keyboard_button(button)
      driver.click(:uiautomation => "au.keyboard().elements()[\"#{button}\"]")
    end
  end
end