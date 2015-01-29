require 'facilethings/base'

module Facilethings	
	class Person < Facilethings::Base
    attr_reader :created_at, :contact_id, :external, :status
    attr_accessor :first_name, :last_name, :mail, :name, :twitter, :facebook,
      :linkedin, :website, :phone, :mobile, :address, :company, :googleplus

  protected
  	def resource_path
    	"/#{VERSION_URL}/people"
  	end
	end
end
