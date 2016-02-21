require 'spec_helper'

describe Facilethings::CouponsData do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN, :endpoint => FT_ENDPOINT)
		@data = Facilethings::CouponsData.new(@client, { coupon: "RSPEC45684", user: 24, 
			status: "paid", currency: "USD", income: 84.0, commission: 8.40, cleared: 0.0 })
	end

	describe "#attr_accessor" do
		it "should build set methods for accessor attributes" do
			@data.currency = "EUR"
			@data.income = 64.0
			@data.commission = 6.40
			@data.cleared = 3.20

			expect(@data.currency).to eq("EUR")
			expect(@data.income).to eq(64.0)
			expect(@data.commission).to eq(6.40)
			expect(@data.cleared).to eq(3.20)
		end
	end

end