require 'facilethings/base'

module Facilethings	
	class TrafficData < Facilethings::Base
    attr_accessor :status, :currency, :income, :commission, :cleared
	end
end
