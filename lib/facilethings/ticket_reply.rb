require 'facilethings/base'

module Facilethings	
	class TicketReply < Facilethings::Base
    attr_reader :user_id, :ticket_id
    attr_accessor :detail
    attr_object :user

    attr_accessor :keep_ticket_open

  protected
  	def resource_path
    	"/#{VERSION_URL}/tickets/#{ticket_id}/ticket_replies"
  	end
	end
end
