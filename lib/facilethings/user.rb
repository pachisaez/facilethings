require 'facilethings/base'
require 'facilethings/users/usage_info'
require 'facilethings/users/weekly_info'

module Facilethings	
	class User < Facilethings::Base
    attr_reader :info, :time_zone, :role
    attr_reader :first_name, :last_name, :avatar
    attr_accessor :language, :mail, :password, :password_confirmation
    attr_accessor :source, :campaign_code, :active
    attr_datetime :next_payment
    attr_accessor :automated_billing

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

    def cohort_item
      @client.get_with_object("#{resource_path}/#{self.id}/cohort_item.json", 
        {}, Facilethings::CohortItem, :cohort_item)
    end

    def usage_info
      @client.get_with_object("#{resource_path}/#{self.id}/usage.json", 
        {}, Facilethings::UsageInfo, nil)
    end

    def weekly_info
      @client.get_with_object("#{resource_path}/#{self.id}/weekly_info.json", 
        {}, Facilethings::WeeklyInfo, nil)
    end

    def events
      @client.get_with_objects("#{resource_path}/#{self.id}/events.json", 
        {}, Facilethings::CohortEvent, :cohort_event)
    end

    def send_confirm
      result = @client.get("#{resource_path}/#{self.id}/send_confirm.json")
      result[:ok]
    end

    def cancel
      result = @client.put(resource_path + "/#{id}/cancel.json")
      self.active = false if result[:ok]
      result[:ok]
    end

    def activate
      result = @client.put(resource_path + "/#{id}/activate.json") 
      self.active = true if result[:ok]
      result[:ok]
    end

  protected
  	def resource_path
    	"/#{VERSION_URL}/users"
  	end

	end
end
