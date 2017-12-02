require 'facilethings/base'

module Facilethings	
	class Channel < Facilethings::Base

    def restart
      @client.put(resource_path + "/#{id}/restart.json") 
    end

  protected
  	def resource_path
    	"/#{VERSION_URL}/gcal_configs"
  	end
	end
end
