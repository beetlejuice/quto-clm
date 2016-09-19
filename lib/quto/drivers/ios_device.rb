require 'quto/drivers/base_driver'

module Quto
  module Drivers
    class IOSDevice < Quto::Drivers::BaseDriver

      def initialize(config)
        @config = config
      end

      def desired_caps
        {
          caps: {
            deviceName: @config['device'],
            platformName: @config['platform'],
            platformVersion: @config['version'],
            udid: @config['udid'],
            autoAcceptAlerts: true
          }
        }
      end
    end
  end
end