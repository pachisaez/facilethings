require 'facilethings/coupon'

module Facilethings
  module REST
    module Ticket
      def find_tickets
        get_with_objects("/v1/tickets.json", Facilethings::Ticket, :ticket)
      end
    end
  end
end