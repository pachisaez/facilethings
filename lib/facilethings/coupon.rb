require 'facilethings/base'

module Facilethings	
	class Coupon < Facilethings::Base
    attr_reader :code, :amount, :discount
	end
end
