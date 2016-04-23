require 'facilethings/base'

module Facilethings	
	class BillingInfo < Facilethings::Base
    attr_accessor :next_payment, :subscription, :automated
    attr_reader :campaign, :coupon, :source
    attr_float :ltv_eur, :ltv_usd
	end
end
