require 'facilethings/base'

module Facilethings	
	class Admin < Facilethings::Base
    attr_accessor :blog_post, :blog_title_en, :blog_title_es

    def refresh_latest_post
      result = @client.get("/v1/admin/expire_cache")
      result[:ok]
    end

  protected
  	def resource_path
    	"/#{VERSION_URL}/admin"
  	end

	end
end
