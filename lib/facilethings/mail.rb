require 'facilethings/base'

module Facilethings	
  class Mail < Facilethings::Base
    attr_reader :was_client
    attr_accessor :mail, :language, :marked, :first_name

  protected
    def resource_path
      "/#{VERSION_URL}/mails"
    end
	end
end
