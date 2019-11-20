require 'facilethings/base'

module Facilethings	
	class OcalConnection < Facilethings::Base
    attr_reader :subscription_id, :subscription_expiration

    def renew
      @client.put(resource_path + "/#{id}/renew_subscription.json") 
    end

  protected
  	def resource_path
    	"/#{VERSION_URL}/ocal_connections"
  	end
	end
end
