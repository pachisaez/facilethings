require 'facilethings/base'

module Facilethings	
	class Ticket < Facilethings::Base
    attr_reader :created_at, :user_id, :detail, :language
    attr_accessor :state, :closed_at
    attr_object :user

    def replies
      @client.get_with_objects("/v1/tickets/#{id}/ticket_replies.json", 
        {}, Facilethings::TicketReply, :ticket_reply)
    end

  protected
  	def resource_path
    	"/#{VERSION_URL}/tickets"
  	end
	end
end
