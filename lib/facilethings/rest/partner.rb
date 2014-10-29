require 'facilethings/partner'
require 'facilethings/traffic_data'
require 'facilethings/coupons_data'

module Facilethings
  module REST
    module Partner
      def partner
        get_with_object("/v1/partners.json", Facilethings::Partner)
      end

      def traffic_data(from, to)
        get_with_objects("/v1/partners/traffic.json", { :params => { :from => from, :to => to } }, Facilethings::TrafficData)
      end

      def coupons_data(from, to)
        get_with_objects("/v1/partners/coupons.json", { :params => { :from => from, :to => to } }, Facilethings::CouponsData)
      end

      def unused_coupons
        get_with_objects("/v1/coupons.json", {}, Facilethings::Coupon)
      end

    end
  end
end