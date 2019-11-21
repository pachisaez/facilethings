require 'facilethings/ocal_config'

module Facilethings
  module REST
    module OcalConfig
      def find_ocal_configs(conditions=nil)
        get_with_objects("/v1/ocal_configs.json?#{conditions}", {}, Facilethings::OcalConfig, :ocal_config)
      end
    end
  end
end