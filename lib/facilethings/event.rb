require 'facilethings/base'

module Facilethings	
	class Event < Facilethings::Base
    attr_reader :name, :description

  protected
  	def resource_path
    	"/#{VERSION_URL}/events"
  	end
	end

end
