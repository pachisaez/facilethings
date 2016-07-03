require 'facilethings/base'
require 'facilethings/users/billing_info'
require 'facilethings/users/usage_info'

module Facilethings	
	class User < Facilethings::Base
    attr_reader :info, :time_zone, :role
    attr_reader :first_name, :last_name, :avatar
    attr_accessor :language, :mail, :password, :password_confirmation
    attr_accessor :source, :campaign_code, :active

    def avatar_filename
 	  	bucket = ENV['RAILS_ENV']=='production' ? "FacileThings" : "ft-dev"
    	if avatar and (avatar[:id] and avatar[:filename])
	    	parts = avatar[:filename].split('.')
	    	filename = parts[0]+"_thumb."+parts[1]
	    	"https://s3.amazonaws.com/#{bucket}/avatars/#{avatar[:id]}/#{filename}"
	    else
	    	"https://s3.amazonaws.com/#{bucket}/default/thumbnail_thumb.png"
	    end
    end

    def billing_info
      @client.get_with_object("#{resource_path}/#{self.id}/billing.json", 
        {}, Facilethings::BillingInfo, nil)
    end

    def usage_info
      @client.get_with_object("#{resource_path}/#{self.id}/usage.json", 
        {}, Facilethings::UsageInfo, nil)
    end

    def events
      @client.get_with_objects("#{resource_path}/#{self.id}/events.json", 
        {}, Facilethings::CohortEvent, :cohort_event)
    end

    def send_confirm
      result = @client.get("#{resource_path}/#{self.id}/send_confirm.json")
      result[:ok]
    end

  protected
  	def resource_path
    	"/#{VERSION_URL}/users"
  	end

	end
end
