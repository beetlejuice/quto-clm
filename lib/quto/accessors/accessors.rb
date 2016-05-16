module Quto
  module Accessors

    def view(name, locator)
      define_method("#{name}") do
        Quto::Accessors::View.new(locator)
      end

      define_method("#{name}_click") do
        Quto::Accessors::View.new(locator).click
      end
    end

    def label(name, locator)
      view(name, locator)
    end

    def text_field(name, locator)
      view(name, locator)
    end

    def button(name, locator)
      view(name, locator)
    end

    def image(name, locator)
      view(name, locator)
    end

    # TODO: Add separate child class
    def alert(name, locator)
      define_method("#{name}_view") do
        Quto::Accessors::View.new(locator)
      end
    end

    def table(name, locator)
      define_method("#{name}_view") do
        Quto::Accessors::Table.new(locator)
      end
    end

    def screen_section(name, screen_section)
      define_method("#{name}") do
        screen_section.new
      end
    end
  end
end