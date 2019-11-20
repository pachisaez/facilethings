require 'facilethings/ocal_connection'

module Facilethings
  module REST
    module OcalConnection
      def find_ocal_connections(conditions=nil)
        get_with_objects("/v1/ocal_connections.json?#{conditions}", {}, Facilethings::OcalConnection, :ocal_connection)
      end
    end
  end
end