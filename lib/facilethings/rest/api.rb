require 'facilethings/rest/user'
require 'facilethings/rest/partner'
require 'facilethings/rest/coupon'

require 'facilethings/rest/stuff'

module Facilethings
  module REST
    module API
      include Facilethings::REST::User
      include Facilethings::REST::Partner
      include Facilethings::REST::Coupon

      include Facilethings::REST::Stuff
    end
  end
end