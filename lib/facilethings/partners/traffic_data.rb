require 'facilethings/base'

module Facilethings	
	class TrafficData < Facilethings::Base
    attr_reader :user, :status, :date
    attr_accessor :currency, :income, :commission, :cleared
	end
end
