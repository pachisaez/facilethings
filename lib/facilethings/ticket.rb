require 'facilethings/base'

module Facilethings	
	class Ticket < Facilethings::Base
    attr_reader :created_at, :user_id, :detail, :language
    attr_accessor :state, :closed_at

  protected
  	def resource_path
    	"/#{VERSION_URL}/tickets"
  	end
	end
end
