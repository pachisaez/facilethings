require 'facilethings/base'
require 'facilethings/partners/traffic_data'
require 'facilethings/partners/coupons_data'

module Facilethings	
	class Partner < Facilethings::Base
    attr_reader :currency, :banner_source, :blog_commission,
    	:min_discount, :max_discount, :individual_coupons, :group_coupons
    attr_accessor :discount

		def coupons?
			self.individual_coupons || self.group_coupons
		end

    def traffic_data(from, to)
      @client.get_with_objects("/v1/partners/traffic.json", 
      	{ :params => { :from => from, :to => to } }, 
      	Facilethings::TrafficData, nil)
    end

    def coupons_data(from, to)
      @client.get_with_objects("/v1/partners/coupons.json", 
      	{ :params => { :from => from, :to => to } }, 
      	Facilethings::CouponsData, nil)
    end

  protected
    def resource_path
      "/#{VERSION_URL}/partners"
    end
	end
end
