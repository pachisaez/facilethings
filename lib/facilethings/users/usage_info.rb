require 'facilethings/base'

module Facilethings	
	class UsageInfo < Facilethings::Base
    attr_reader :day, :week, :month, :stuff, :projects
    attr_float :growth
	end
end
