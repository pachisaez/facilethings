require 'facilethings/user'

module Facilethings
  module REST
    module User
      def user
        get_with_object("/v1/users.json", Facilethings::User)
      end
    end
  end
end