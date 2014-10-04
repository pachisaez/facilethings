require 'facilethings/base'

module Facilethings	
	class TrafficData < Facilethings::Base
    attr_reader :date, :user_id, :status, :income, :commission, :cleared
	end
end
