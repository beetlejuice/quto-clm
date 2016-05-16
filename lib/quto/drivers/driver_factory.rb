require 'quto/drivers/ios_device'
require 'quto/drivers/ios_simulator'

module Quto
  module Drivers
    class DriverFactory

      def self.driver_for(config, is_clean)
        if use_physical?(config)
          ios_physical_driver(config)
        else
          ios_simulator_driver(config, is_clean)
        end
      end

      def self.use_physical?(config)
        config['use_physical'] || false
      end

      def self.ios_physical_driver(config)
        Quto::Drivers::IOSDevice.new(config)
      end

      def self.ios_simulator_driver(config, is_clean)
        Quto::Drivers::IOSSimulator.new(config, is_clean)
      end
    end
  end
end