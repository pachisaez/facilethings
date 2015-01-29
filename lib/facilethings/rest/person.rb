require 'facilethings/person'

module Facilethings
  module REST
    module Person
    	def find_person(id)
	      get_with_object("/v1/people/#{id}.json", {}, Facilethings::Person, :person)
    	end

    	def find_people(usn, page, list=nil)
      	url = "/v1/people.json?usn=#{usn}&page=#{page}"
    		url = url + "&list=#{list}" if list
        get_with_objects(url, {}, Facilethings::Person, :person)
	    end

    end
  end
end
