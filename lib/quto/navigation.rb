require 'page_navigation'

module Quto
  module Navigation
    include PageNavigation

    def on(screen_class, timeout = 10)
      # screen = screen_class.new($current_profile)
      screen = screen_class.create_for_profile($current_profile)
      wait = 0
      until wait == timeout do
        if screen.active?
          return screen
        else
          sleep 1
          wait += 1
        end
      end
      raise "Expected #{screen_class} to be active"
    end
  end
end