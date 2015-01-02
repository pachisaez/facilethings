require 'facilethings/base'

module Facilethings	
	class CouponsData < Facilethings::Base
    attr_reader :user, :status, :coupon, :date
    attr_accessor :currency, :income, :commission, :cleared
	end
end
