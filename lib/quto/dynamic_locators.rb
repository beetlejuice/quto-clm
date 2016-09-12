# require 'quto/accessors/view'
# require 'quto/accessors/table'
# require 'quto/accessors/table_cell'

ELEMENTS = [:label, :text_field, :button, :image, :table, :table_cell]

module Quto
  module DynamicLocators

    def self.included(cls)
      generate_locators(cls)
    end

    def self.generate_locators(target)
      ELEMENTS.each do |tag|
        generate_locator(target, tag)
      end
    end

    def self.generate_locator(target, accessor_name)
      target.send(:define_method, "#{accessor_name.to_s}_element") do |locator|
        Quto::Accessors::View.new(locator) # TODO: Add case for Table and TableCell
        # self.class.send(accessor_name.to_sym, 'dynamic', locator)
      end
    end
  end
end