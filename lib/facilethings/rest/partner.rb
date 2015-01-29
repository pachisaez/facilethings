require 'facilethings/partner'

module Facilethings
  module REST
    module Partner
      def find_partner
        get_with_object("/v1/partners.json", {}, Facilethings::Partner, :partner)
      end
    end
  end
end