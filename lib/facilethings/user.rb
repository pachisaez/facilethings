require 'facilethings/base'

module Facilethings	
	class User < Facilethings::Base
    attr_reader :language, :time_zone, :info, :mail, :role
    attr_reader :first_name, :last_name, :avatar

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
	end
end
