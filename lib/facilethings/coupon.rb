require 'facilethings/base'

module Facilethings	
	class Coupon < Facilethings::Base
    attr_accessor :code, :note, :stripe_id
    attr_integer :amount
    attr_float :discount

  protected
  	def resource_path
    	"/#{VERSION_URL}/coupons"
  	end
	end
end
