require 'facilethings/partner'
require 'facilethings/traffic_data'
require 'facilethings/coupons_data'

module Facilethings
  module REST
    module Partner
      # logged partner info
      def partner
        get_with_object("/v1/partners.json", Facilethings::Partner)
      end

      # get traffic info if the partner has an affiliate website
      def traffic(partner_id, from, to)
        get_with_objects("/v1/partners/#{partner_id}/traffic.json", { :params => { :from => from, :to => to } }, Facilethings::TrafficData)
      end

      # get coupons info if the partner is an ambassador
      def coupons(partner_id, from, to)
        get_with_objects("/v1/partners/#{partner_id}/coupons.json", { :params => { :from => from, :to => to } }, Facilethings::CouponsData)
      end

    end
  end
end