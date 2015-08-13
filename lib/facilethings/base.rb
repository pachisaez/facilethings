require 'active_support/inflector'
require 'facilethings/error'

module Facilethings

  class Base  

    VERSION_URL = "v1" 

    class << self
      def attr_reader(*attrs)
        attrs.each do |attr|
          define_get_method(attr)
        end
      end

      def attr_accessor(*attrs)
        attrs.each do |attr|
          define_get_method(attr)
          define_set_method(attr)
        end
      end

      def define_get_method(key)
        define_method(key) do
          instance_variable_get("@#{key}")
        end
      end

      def define_set_method(key)
        define_method("#{key}=") do |value|
          instance_variable_set("@#{key}", value)
        end
      end

      def attr_float(*attrs)
        attrs.each do |attr|
          define_getf_method(attr)
          define_setf_method(attr)
        end
      end

      def define_getf_method(key)
        define_method(key) do
          instance_variable_get("@#{key}").to_f
        end
      end

      def define_setf_method(key)
        define_method("#{key}=") do |value|
          instance_variable_set("@#{key}", value.to_f)
        end
      end

      def attr_integer(*attrs)
        attrs.each do |attr|
          define_geti_method(attr)
          define_seti_method(attr)
        end
      end

      def define_geti_method(key)
        define_method(key) do
          instance_variable_get("@#{key}").to_i
        end
      end

      def define_seti_method(key)
        define_method("#{key}=") do |value|
          instance_variable_set("@#{key}", value.to_i)
        end
      end

      def attr_object(attr, object: nil)
        define_method(attr) do
          object_name = object.nil? ? attr.to_s : object
          value = instance_variable_get("@#{attr}")
          eval "Facilethings::#{object_name.capitalize}.new(@client, #{value})"
        end
      end

      def attr_objects(attr, object: nil)
        define_method(attr) do
          values = instance_variable_get("@#{attr}")
          object_name = object.nil? ? attr.to_s : object
          list = []
          values.each do |value|
            list << eval("Facilethings::#{object_name.camelize}.new(@client, #{value})")
          end
          list
        end
      end
    end

    attr_reader :id

    def initialize(client, attrs = {})
      raise Facilethings::Error.new(attrs[:error]) if attrs[:error]
      @client = client
      attrs.each_pair do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def save
      if self.id
        response = @client.put(rest_path, extract_body) 
      else
        response = @client.post(rest_path, extract_body)
        unless response[:error]
          @id = response[response.keys[0]][:id]
        end
      end
      response
    end

    def destroy
      @client.delete(rest_path)
    end

  protected
    def class_symbol
      self.class.to_s.split("::")[1].underscore.to_sym
    end

    def attrs
      self.instance_variables.reject { |v| v==:@client }
    end

    def extract_body
      h = Hash.new
      attrs.each do |attr|
        h[attr.to_s[1..-1].to_sym] = self.instance_variable_get(attr)
      end
      { :body => { class_symbol => h }}
    end

    def resource_path
      ""
    end

    def rest_path
      id ? resource_path + "/#{id}.json" : resource_path + ".json"
    end

    #def camelize(str)
    #  str.split('_').map {|w| w.capitalize}.join
    #end
  end
end