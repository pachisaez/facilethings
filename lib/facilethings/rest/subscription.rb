require 'facilethings/subscription'

module Facilethings
  module REST
    module Subscription
    	def find_subscription_by_code(code)
	      get_with_object("/v1/subscriptions/#{code}.json", {}, Facilethings::Subscription, :subscription)
    	end
    end
  end
end