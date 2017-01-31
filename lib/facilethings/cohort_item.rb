require 'facilethings/base'

module Facilethings	
	class CohortItem < Facilethings::Base
    attr_reader :cohort_id, :user_id, :source
    attr_float :revenue
    attr_object :campaign
    attr_object :coupon
	end

end
