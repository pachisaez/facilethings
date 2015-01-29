require 'facilethings/stuff'

module Facilethings
  module REST
    module Stuff
    	def find_stuff(id)
	      get_with_object("/v1/stuff/#{id}.json", {}, Facilethings::Stuff, :stuff)
    	end

    	def get_stuff(usn, page, list=nil)
      	url = "/v1/stuff.json?usn=#{usn}&page=#{page}"
    		url = url + "&list=#{list}" if list
        get_with_objects(url, {}, Facilethings::Stuff, :stuff)
	    end

    end
  end
end
