require 'facilethings/user'

module Facilethings
  module REST
    module User
      def find_user(id="me")
        get_with_object("/v1/users/#{id}.json", {}, Facilethings::User, :user)
      end

      def find_user_by_email(email)
        get_with_object("/v1/users/me.json?email=#{email}", {}, Facilethings::User, :user)
      end

      def find_users(conditions=nil)
        get_with_objects("/v1/users/all.json?#{conditions}", Facilethings::User, :user)
      end
    end
  end
end