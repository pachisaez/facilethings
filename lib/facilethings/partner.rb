require 'memoizable'
require 'facilethings/base'
require 'facilethings/rest/partner'

module Facilethings	
	class Partner < Facilethings::Base
    attr_reader :id, :user_id, :banner_source, :min_discount, :max_discount,
 	    :discount, :individual_coupons, :group_coupons

		def coupons?
			self.individual_coupons || self.group_coupons
		end
		memoize :coupons?
	end
end
