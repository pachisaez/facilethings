require 'memoizable'
require 'facilethings/error'

module Facilethings
  class Base
    include Memoizable

    attr_reader :attrs
    alias_method :to_h, :attrs
 
    class << self
      # Define methods that retrieve the value from attributes
      def attr_reader(*attrs)
        attrs.each do |attr|
          define_attribute_method(attr)
        end
      end

      # Dynamically define a method for an attribute
      def define_attribute_method(key)
        define_method(key) do
          @attrs[key]
        end
        memoize(key)
      end
    end

    # Initializes a new object
    def initialize(attrs = {})
      raise Facilethings::Error.new(attrs[:error]) if attrs[:error]
      @attrs = attrs || {}
    end

  end
end