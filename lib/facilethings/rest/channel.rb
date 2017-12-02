require 'facilethings/channel'

module Facilethings
  module REST
    module Channel
      def find_channels(conditions=nil)
        get_with_objects("/v1/gcal_configs.json?#{conditions}", {}, Facilethings::Channel, :gcal_config)
      end
    end
  end
end