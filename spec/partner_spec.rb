require 'spec_helper'

describe Facilethings::Partner do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN, :endpoint => FT_ENDPOINT)
		@partner = Facilethings::Partner.new(@client, { id: 1, individual_coupons: true, group_coupons: true,
			currency: "EUR", banner_source: "blog", blog_commission: 10, min_discount: 10,
			max_discount: 40, discount: 10 })
	end

	describe "#attr_reader and #attr_accessor" do
		it "should build get methods for all attributes" do
			expect(@partner.id).to eq(1)
			expect(@partner.individual_coupons).to eq(true)
			expect(@partner.group_coupons).to eq(true)
			expect(@partner.currency).to eq("EUR")
			expect(@partner.banner_source).to eq("blog")
			expect(@partner.blog_commission).to eq(10)
			expect(@partner.min_discount).to eq(10)
			expect(@partner.max_discount).to eq(40)
			expect(@partner.discount).to eq(10)
		end
		it "should build set methods for accessor attributes" do
			@partner.discount = 20.0
			expect(@partner.discount).to eq(20.0)
		end
		it "should not build set methods for reader attributes" do			
			expect{@partner.id = 2}.to raise_error
			expect{@partner.individual_coupons = false}.to raise_error
			expect{@partner.group_coupons = false}.to raise_error
			expect{@partner.currency = "USD"}.to raise_error
			expect{@partner.banner_source = "ftblog"}.to raise_error
			expect{@partner.blog_commission = 12}.to raise_error
			expect{@partner.min_discount = 12}.to raise_error
			expect{@partner.max_discount = 12}.to raise_error
		end
	end

	describe ".coupons?" do
		it "should be allowed to create coupons if individual or group coupons are granted" do
			partner = Facilethings::Partner.new(@client, { id: 1, individual_coupons: true, group_coupons: true })
			expect(partner.coupons?).to be true
			partner = Facilethings::Partner.new(@client, { id: 2, individual_coupons: true, group_coupons: false})
			expect(partner.coupons?).to be true
			partner = Facilethings::Partner.new(@client, { id: 3, individual_coupons: false, group_coupons: true})
			expect(partner.coupons?).to be true
		end
		it "should not be allowed to create coupons if no coupons are granted" do
			partner = Facilethings::Partner.new(@client, { id: 1, individual_coupons: false, group_coupons: false})
			expect(partner.coupons?).to be false
		end
	end

	describe ".traffic_data" do
    before do
      stub_get('/v1/partners/traffic.json?from=2014-10-01&to=2014-10-31').to_return(:body => fixture('traffic_data.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    it 'requests the correct resource' do
      data = @partner.traffic_data("2014-10-01", "2014-10-31")
      expect(a_get('/v1/partners/traffic.json?from=2014-10-01&to=2014-10-31')).to have_been_made
      expect(data.count).to eq 3
    end
  end

  describe ".coupons_data" do
    before do
      stub_get('/v1/partners/coupons.json?from=2014-10-01&to=2014-10-31').to_return(:body => fixture('coupons_data.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    it 'requests the correct resource' do
      data = @partner.coupons_data("2014-10-01", "2014-10-31")
      expect(a_get('/v1/partners/coupons.json?from=2014-10-01&to=2014-10-31')).to have_been_made
      expect(data.count).to eq 4
    end
  end

end