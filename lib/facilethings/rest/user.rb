require 'facilethings/user'

module Facilethings
  module REST
    module User
      def find_user
        get_with_object("/v1/users.json", {}, Facilethings::User, :user)
      end
    end
  end
end