require 'facilethings/base'

module Facilethings	
	class Campaign < Facilethings::Base
    attr_accessor :code, :description_es, :description_en, :finishes_at, :recurring

  protected
  	def resource_path
    	"/#{VERSION_URL}/campaigns"
  	end
	end
end
