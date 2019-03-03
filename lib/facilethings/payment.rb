require 'facilethings/base'

module Facilethings	
	class Payment < Facilethings::Base
    attr_reader :mc_currency
    attr_float :mc_gross, :tax
    attr_object :subscription

  protected
  	def resource_path
    	"/#{VERSION_URL}/payments"
  	end
  end
end
