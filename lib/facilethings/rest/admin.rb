require 'facilethings/admin'

module Facilethings
  module REST
    module Admin
      def find_admin
        get_with_object("/v1/admin.json", {}, Facilethings::Admin, :admin)
      end
    end
  end
end