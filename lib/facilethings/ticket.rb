require 'facilethings/base'

module Facilethings
	class Ticket < Facilethings::Base
    attr_reader :user_id, :detail, :language
    attr_accessor :state, :closed_at, :faq
    attr_object :user

    def replies
      @client.get_with_objects("/v1/tickets/#{id}/ticket_replies.json",
        {}, Facilethings::TicketReply, :ticket_reply)
    end

    def files
      @client.get_with_objects("/v1/tickets/#{id}/ticket_files.json",
        {}, Facilethings::TicketFile, :ticket_file)
    end

    def close
      @client.put(resource_path + "/#{id}/close.json")
    end

    def set_faq(faq)
      @client.put(resource_path + "/#{id}/set_faq.json?faq=#{faq}")
    end

  protected
  	def resource_path
    	"/#{VERSION_URL}/tickets"
  	end
	end
end
