require 'facilethings/base'

module Facilethings	
	class Checkpoint < Facilethings::Base
    attr_accessor :description

  protected
  	def resource_path
    	"/#{VERSION_URL}/checkpoint"
  	end
	end
end
