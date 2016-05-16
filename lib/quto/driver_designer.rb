require 'yaml'
require 'quto/drivers/driver_factory'

module Quto
  class DriverDesigner
    def self.create_driver(is_clean)
      config = YAML.load(File.open('config.yml'))
      Quto::Drivers::DriverFactory.driver_for(config, is_clean)
    end
  end
end