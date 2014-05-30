require 'spec_helper'

describe Facilethings::Partner do
	it "should be allowed to create coupons if individual or group coupons are granted" do
		partner = Facilethings::Partner.new(id: 1, individual_coupons: true, group_coupons: true)
		expect(partner.coupons?).to be true
		partner = Facilethings::Partner.new(id: 2, individual_coupons: true, group_coupons: false)
		expect(partner.coupons?).to be true
		partner = Facilethings::Partner.new(id: 3, individual_coupons: false, group_coupons: true)
		expect(partner.coupons?).to be true
	end
	it "should not be allowed to create coupons if no coupons are granted" do
		partner = Facilethings::Partner.new(id: 1, individual_coupons: false, group_coupons: false)
		expect(partner.coupons?).to be false
	end
end