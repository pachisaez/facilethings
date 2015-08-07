require 'facilethings/base'

module Facilethings	
	class TicketReply < Facilethings::Base
    attr_reader :created_at, :user_id, :ticket_id
    attr_accessor :detail
    attr_object :user

  protected
  	def resource_path
    	"/#{VERSION_URL}/ticket_replies"
  	end
	end
end
