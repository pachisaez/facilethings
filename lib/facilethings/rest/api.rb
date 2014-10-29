require 'facilethings/rest/user'
require 'facilethings/rest/partner'
require 'facilethings/rest/coupon'

module Facilethings
  module REST
    module API
      include Facilethings::REST::User
      include Facilethings::REST::Partner
      include Facilethings::REST::Coupon
    end
  end
end