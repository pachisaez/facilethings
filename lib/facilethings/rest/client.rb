require 'facilethings/client'
require 'facilethings/rest/api'

module Facilethings
  module REST
    class Client < Facilethings::Client
      include Facilethings::REST::API

      def get(url)
        JSON.parse access_token.get(url).body, symbolize_names: true
      end

	    def get_with_object(url, klass)
	      klass.new(get(url))
	    end

	    def get_with_objects(url, klass)
	    	data = get(url)
	      data.collect do |element|
	        klass.new(element)
	      end
	    end
    end
  end
end