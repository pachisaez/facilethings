require 'spec_helper'

describe Facilethings::REST::Coupon do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN, :endpoint => FT_ENDPOINT)
	end

  describe ".find_coupons" do
  	before do
    	stub_get('/v1/coupons.json').to_return(:body => fixture('coupons.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
  	end
    it 'requests the correct resource' do
      data = @client.find_coupons
      expect(a_get('/v1/coupons.json')).to have_been_made
      expect(data.count).to eq 3
    end
	end

  describe ".find_coupon" do
    before do
      stub_get('/v1/coupons/14.json').to_return(:body => fixture('coupon.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    it "should return the partner's coupon identified" do
      coupon = @client.find_coupon(14)

      expect(a_get('/v1/coupons/14.json')).to have_been_made
      expect(coupon).to be_a Facilethings::Coupon
    end
  end

end
