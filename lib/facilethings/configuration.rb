module Facilethings

  module Configuration
    VALID_CONNECTION_KEYS = [:key, :secret, :token].freeze
    VALID_OPTIONS_KEYS    = [:method, :format, :endpoint].freeze
    VALID_CONFIG_KEYS     = VALID_CONNECTION_KEYS + VALID_OPTIONS_KEYS

    DEFAULT_ENDPOINT = 'http://api.facilethings.com'
    DEFAULT_METHOD = :get
    DEFAULT_FORMAT = :json
 
    # Build accessor methods for every config options so we can do this, for example:
    # Facilethings.format = :xml
    attr_accessor *VALID_CONFIG_KEYS
 
    # Make sure we have the default values set when we get 'extended'
    def self.extended(base)
      base.reset
    end
 
    def reset
      self.key = nil
      self.secret = nil
      self.token = nil

      self.endpoint = DEFAULT_ENDPOINT
      self.method = DEFAULT_METHOD
      self.format = DEFAULT_FORMAT
    end

    def configure
      yield self
    end

    def options
      Hash[ * VALID_CONFIG_KEYS.map { |key| [key, send(key)] }.flatten ]
    end
 
  end # Configuration

end
