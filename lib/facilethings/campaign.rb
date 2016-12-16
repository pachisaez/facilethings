require 'facilethings/base'

module Facilethings	
	class Campaign < Facilethings::Base
    attr_accessor :code, :description_es, :description_en, :recurring
    attr_datetime :finishes_at

  protected
  	def resource_path
    	"/#{VERSION_URL}/campaigns"
  	end
	end
end
