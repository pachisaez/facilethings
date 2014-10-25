require 'facilethings/base'

module Facilethings	
	class TrafficData < Facilethings::Base
    attr_reader :status, :id, :currency, :income, :commission, :cleared
	end
end
