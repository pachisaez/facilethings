require 'facilethings/user'

module Facilethings
  module REST
    module User
      def find_user(id)
        get_with_object("/v1/users/#{id}.json", {}, Facilethings::User, :user)
      end
    end
  end
end