require 'facilethings/rest/user'
require 'facilethings/rest/partner'

module Facilethings
  module REST
    module API
      include Facilethings::REST::User
      include Facilethings::REST::Partner
    end
  end
end