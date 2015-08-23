require 'facilethings/rest/user'
require 'facilethings/rest/partner'
require 'facilethings/rest/coupon'

require 'facilethings/rest/ticket'
require 'facilethings/rest/ticket_reply'

require 'facilethings/rest/stuff'
require 'facilethings/rest/person'

module Facilethings
  module REST
    module API
      include Facilethings::REST::User
      include Facilethings::REST::Partner
      include Facilethings::REST::Coupon
      include Facilethings::REST::Ticket
      include Facilethings::REST::TicketReply

      include Facilethings::REST::Stuff
      include Facilethings::REST::Person
    end
  end
end