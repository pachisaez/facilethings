require 'facilethings/base'

module Facilethings	
	class TrafficData < Facilethings::Base
    attr_reader :status, :count, :income, :commission, :cleared
	end
end
