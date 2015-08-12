require 'facilethings/base'

module Facilethings	
	class TicketFile < Facilethings::Base
    attr_reader :created_at, :ticket_id, :filename

  def url
  	bucket = ENV['RAILS_ENV']=='production' ? "FacileThings" : "ft-dev"
   	"https://s3.amazonaws.com/#{bucket}/ticket_files/#{id}/#{filename}"
  end

  protected
  	def resource_path
    	"/#{VERSION_URL}/tickets/#{ticket_id}/ticket_files"
  	end
	end
end
