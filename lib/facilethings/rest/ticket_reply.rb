require 'facilethings/ticket_reply'

module Facilethings
  module REST
    module TicketReply
      def new_ticket(params)
        new_object(Facilethings::TicketReply, params)
      end
    end
  end
end