require 'facilethings/base'

module Facilethings	
	class Coupon < Facilethings::Base
    attr_reader :created_at
    attr_accessor :code, :note, :amount, :discount

    @@resource_path = '/v1/coupons' 
	end
end
