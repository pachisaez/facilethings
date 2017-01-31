require 'facilethings/campaign'

module Facilethings
  module REST
    module Campaign
    	def find_campaign_by_code(code)
	      get_with_object("/v1/campaigns/#{code}.json", {}, Facilethings::Campaign, :campaign)
    	end
    end
  end
end