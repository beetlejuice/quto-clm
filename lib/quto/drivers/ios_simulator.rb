require 'quto/drivers/base_driver'

module Quto
  module Drivers
    class IOSSimulator < Quto::Drivers::BaseDriver

      def initialize(config, is_clean = false)
        @config = config
        @is_clean = is_clean
      end

      def desired_caps
        {
          caps: {
            app: @config['sim_app_path'],
            deviceName: @config['device'],
            platformName: @config['platform'],
            platformVersion: @config['version'],
            locationServicesAuthorized: true,
            bundleId: @config['bundle_id'],
            noReset: true,
            fullReset: @is_clean,
            autoLaunch: false
          }
        }
      end
    end
  end
end