require 'facilethings/base'

module Facilethings	
	class User < Facilethings::Base
    attr_reader :language, :time_zone, :info, :mail, :role, :created_at
	end
end
