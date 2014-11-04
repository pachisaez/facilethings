require 'facilethings/base'

module Facilethings	
	class CouponsData < Facilethings::Base
		attr_reader :user, :status, :coupon
    attr_accessor :currency, :income, :commission, :cleared

    #def convert_to(currency, rate)
    #	@attrs[:currency] = currency
    #	@attrs[:income] = (@attrs[:income]*rate).round(2)
    #	@attrs[:commission] = (@attrs[:commission]*rate).round(2)
    #	@attrs[:cleared] = (@attrs[:cleared]*rate).round(2)
    #end
	end
end
