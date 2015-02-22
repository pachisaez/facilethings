require 'facilethings/base'

module Facilethings	
	class TrafficData < Facilethings::Base
    attr_reader :user, :status, :date 
    attr_accessor :currency
    attr_float :income, :commission, :cleared
	end
end
