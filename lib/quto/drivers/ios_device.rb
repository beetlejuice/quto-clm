require 'quto/drivers/base_driver'

module Quto
  module Drivers
    class IOSDevice < Quto::Drivers::BaseDriver

      def initialize(config)
        @config = config
      end

      def caps
        {app: @config['phys_app_path'],
         deviceName: @config['device'],
         platformName: @config['platform'],
         platformVersion: @config['version'],
         udid: @config['udid'],
         autoAcceptAlerts: true}
      end
    end
  end
end