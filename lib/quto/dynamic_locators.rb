require 'quto/accessors/view'

ELEMENTS = [:label, :text_field, :button, :image]

module Quto
  module DynamicLocators

    def included(cls)
      self.class.generate_locators(cls)
    end

    private

    def self.generate_locators(target)
      ELEMENTS.each do |tag|
        target.send(:define_method, "#{tag.to_s}_element)") do |locator|
          Quto::Accessors::View.new(locator)
        end
      end
    end
  end
end