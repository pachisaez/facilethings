require 'facilethings/user'
require 'facilethings/partner'

module Facilethings
  module REST
    module User
      def user
        # logged user info
        get_with_object("/v1/users.json", Facilethings::User)
      end

      def partner
        # logged partner info
        get_with_object("/v1/partners.json", Facilethings::Partner)
      end
    end
  end
end