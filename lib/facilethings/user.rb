require 'facilethings/base'

module Facilethings	
	class User < Facilethings::Base
    attr_reader :id, :language, :time_zone, :info, :mail
	end
end
