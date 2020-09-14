require 'facilethings/mail'

module Facilethings
  module REST
    module Mail
    	def find_email(id)
	      get_with_object("/v1/mails/#{id}.json", {}, Facilethings::Mail, :mail)
      end

    	def find_email_by_email(email)
	      get_with_object("/v1/mails.json?email=#{email}", {}, Facilethings::Mail, :mail)
      end
    end
  end
end