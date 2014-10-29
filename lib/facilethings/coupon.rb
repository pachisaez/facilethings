require 'facilethings/base'

module Facilethings	
	class Coupon < Facilethings::Base
    attr_reader :code, :note, :amount, :discount
	end
end
