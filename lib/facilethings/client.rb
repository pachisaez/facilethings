require "oauth2"
require "json"

require "facilethings/api/user"
require "facilethings/api/partner"

module Facilethings

 class Client
    include Facilethings::API::User
    include Facilethings::API::Partner

    # Define the same set of accessors as the Facilethings module
    attr_accessor *Configuration::VALID_CONFIG_KEYS
 
    def initialize(options={})
      # Merge the config values from the module and those passed to the client.
      merged_options = Facilethings.options.merge(options)
      # Copy the merged values to this client and ignore those not part of our configuration
      Configuration::VALID_CONFIG_KEYS.each do |key|
        send("#{key}=", merged_options[key])
      end
    end

    def get(url)
      JSON.parse access_token.get(url).body
    end

    private
      def oauth_client
        @oauth_client ||= OAuth2::Client.new(self.key, self.secret, { site: self.endpoint })
      end

      def access_token
        @access_token ||= OAuth2::AccessToken.new(oauth_client, self.token)
      end

  end # Client

end