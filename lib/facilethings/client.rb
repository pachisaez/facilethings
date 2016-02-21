require "oauth2"

module Facilethings
  class Client
    attr_accessor :key, :secret, :token, :endpoint
    URL_PREFIX = "https://api.facilethings.com"

    def initialize(options = {})
      options.each do |key, value|
        send(:"#{key}=", value)
      end
      yield(self) if block_given?
      self.endpoint = URL_PREFIX if self.endpoint.nil?
    end

    def credentials
      {
        :key => key,
        :secret => secret,
        :token => token,
      }
    end

    def credentials?
      credentials.values.all?
    end

    private
      def oauth_client
        @oauth_client ||= OAuth2::Client.new(self.key, self.secret, { site: self.endpoint })
      end
      
      def access_token
        @access_token ||= OAuth2::AccessToken.new(oauth_client, self.token)
      end
  end
end
