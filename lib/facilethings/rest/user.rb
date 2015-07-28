require 'facilethings/user'

module Facilethings
  module REST
    module User
      def find_user(username=nil)
      	# username is only used for testing purposes, so we can set different data in the external adapter
        get_with_object("/v1/users.json", {}, Facilethings::User, :user)
      end
    end
  end
end