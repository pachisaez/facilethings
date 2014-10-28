require 'facilethings/base'

module Facilethings	
	class CouponsData < Facilethings::Base
    attr_reader :coupon, :user, :status, :currency, :income, :commission, :cleared
	end
end
