require 'facilethings/base'

module Facilethings	
	class CohortEvent < Facilethings::Base
    attr_reader :cohort_item_id, :checked, :currency
    attr_float :revenue
    attr_object :event
	end

end

