require 'facilethings/base'

module Facilethings	
	class Goal < Facilethings::Base
    attr_accessor :name

  protected
  	def resource_path
    	"/#{VERSION_URL}/goals"
  	end
	end
end
