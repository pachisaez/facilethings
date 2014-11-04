require 'facilethings/coupon'

module Facilethings
  module REST
    module Coupon
    	def find_coupon(id)
	      get_with_object("/v1/coupons/#{id}.json", {}, Facilethings::Coupon)
    	end

      def find_coupons
        get_with_objects("/v1/coupons.json", Facilethings::Coupon)
      end
    end
  end
end