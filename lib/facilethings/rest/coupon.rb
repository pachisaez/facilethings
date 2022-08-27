require 'facilethings/coupon'

module Facilethings
  module REST
    module Coupon
    	def find_coupon(id)
	      get_with_object("/v1/coupons/#{id}.json", {}, Facilethings::Coupon, :coupon)
    	end

      def find_coupon_by_code(code)
        get_with_object("/v1/coupons/#{code}.json", {}, Facilethings::Coupon, :coupon)
      end

      def find_coupons
        get_with_objects("/v1/coupons.json", Facilethings::Coupon, :coupon)
      end
    end
  end
end