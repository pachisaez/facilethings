require 'facilethings/client'
require 'facilethings/rest/api'

module Facilethings
  module REST
    class Client < Facilethings::Client
      include Facilethings::REST::API

      def get(url, options = {})
        JSON.parse access_token.get(url, options).body, symbolize_names: true
      end

      def put(url, options = {})
        JSON.parse access_token.put(url, options).body, symbolize_names: true
      end

      def post(url, options = {})
        JSON.parse access_token.post(url, options).body, symbolize_names: true
      end

      def delete(url, options = {})
        JSON.parse access_token.delete(url, options).body, symbolize_names: true
      end

	    def get_with_object(url, options = {}, klass, object)
        element = get(url, options)
        element = element[object] if object and not element[:error]
	      klass.new(self, element)
	    end

	    def get_with_objects(url, options = {}, klass, object)
	    	data = get(url, options)
	      data.collect do |element|
          puts element.inspect
          element = element[object] if object and not element[:error]
	        klass.new(self, element)
	      end
	    end

      def new_object(klass, params = {})
        klass.new(self, params)
      end
    end
  end
end