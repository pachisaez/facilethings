require 'facilethings/base'

module Facilethings	
	class Coupon < Facilethings::Base
    attr_reader :created_at
    attr_accessor :code, :note, :amount, :discount

  protected
  	def resource_path
    	"/#{VERSION_URL}/coupons"
  	end
	end
end
