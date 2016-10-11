require 'facilethings/base'

module Facilethings	
	class Project < Facilethings::Base
    attr_accessor :name

  protected
  	def resource_path
    	"/#{VERSION_URL}/project"
  	end
	end
end
