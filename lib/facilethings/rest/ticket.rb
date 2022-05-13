require 'facilethings/ticket'

module Facilethings
  module REST
    module Ticket
      def find_tickets
        get_with_objects("/v1/tickets.json", Facilethings::Ticket, :ticket)
      end

    	def find_ticket(id)
	      get_with_object("/v1/tickets/#{id}.json", {}, Facilethings::Ticket, :ticket)
    	end

      def find_tickets_history(page=1)
        get_paginated_objects("/v1/tickets/history.json?page=#{page}", {}, Facilethings::Ticket, :ticket)
      end

    end
  end
end