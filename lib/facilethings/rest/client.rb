require 'facilethings/client'
require 'facilethings/rest/api'

module Facilethings
  module REST
    class Client < Facilethings::Client
      include Facilethings::REST::API

      def get(url, options = {})
        JSON.parse access_token.get(url, options).body, symbolize_names: true
      end

	    def get_with_object(url, options = {}, klass)
	      klass.new(get(url, options))
	    end

	    def get_with_objects(url, options = {}, klass)
	    	data = get(url, options)
	      data.collect do |element|
	        klass.new(element)
	      end
	    end
    end
  end
end