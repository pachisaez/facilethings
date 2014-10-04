require 'facilethings/partner'
require 'facilethings/traffic_data'

module Facilethings
  module REST
    module Partner
      # logged partner info
      def partner
        get_with_object("/v1/partners.json", Facilethings::Partner)
      end

      # get traffic info if the partner has an affiliate website
      def traffic(partner_id)
        get_with_objects("/v1/partners/#{partner_id}/traffic.json", Facilethings::TrafficData)
      end

    end
  end
end