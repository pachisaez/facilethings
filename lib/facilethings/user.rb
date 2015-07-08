require 'facilethings/base'

module Facilethings	
	class User < Facilethings::Base
    attr_reader :language, :time_zone, :info, :mail, :role, :created_at
    attr_reader :first_name, :last_name, :avatar

    def avatar_filename
    	if avatar and (avatar[:id] and avatar[:filename])
	    	parts = avatar[:filename].split('.')
	    	filename = parts[0]+"_thumb."+parts[1]
	    	"https://s3.amazonaws.com/ft-dev/avatars/#{avatar[:id]}/#{filename}"
	    else
	    	"https://s3.amazonaws.com/FacileThings/default/thumbnail_thumb.png"
	    end
    end
	end
end
