require 'quto/accessors/view'
require 'quto/accessors/table'
require 'quto/accessors/table_cell'

BASIC_ELEMENTS = [:label, :text_field, :button, :image]

module Quto
  module DynamicLocators

    def included(cls)
      self.class.generate_locators(cls)
    end

    private

    def self.generate_locators(target)

    end

    def self.generate_basic_locators(target)
      BASIC_ELEMENTS.each do |tag|
        generate_locator target, tag
      end

      generate_locator target, 'Table'
      generate_locator target, 'TableCell'
    end

    def self.generate_locator(target, accessor_name)
      target.send(:define_method, "#{tag.to_s}_element)") do |locator|
        Quto::Accessors.const_get(accessor_name).new
      end
    end
  end
end