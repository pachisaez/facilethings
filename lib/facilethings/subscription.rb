require 'facilethings/base'

module Facilethings	
	class Subscription < Facilethings::Base
    attr_accessor :code, :description_es, :description_en, :recurring, :months, :currency
    attr_accessor :campaign_id
    attr_float :price

  protected
  	def resource_path
    	"/#{VERSION_URL}/subscriptions"
  	end
	end
end
