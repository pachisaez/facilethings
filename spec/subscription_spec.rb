require 'spec_helper'

describe Facilethings::Subscription do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN, :endpoint => FT_ENDPOINT)
	end

	describe "#attr_reader and #attr_accessor" do
		it "should build get methods for all attributes" do
			subscription = Facilethings::Subscription.new(@client, { :id => 17, :created_at => DateTime.now,
				:code => "standard-12", :currency => "USD", :description_es => "Estándar", :description_en => "Standard",
				:months => 12, :campaign_id => 7, :recurring => false, :price => 99.99 })
			expect(subscription.id).to eq(17)
			expect(subscription.created_at).to be_a DateTime
			expect(subscription.code).to eq("standard-12")
			expect(subscription.currency).to eq("USD")
			expect(subscription.price).to eq(99.99)
			expect(subscription.description_es).to eq("Estándar")
			expect(subscription.description_en).to eq("Standard")
			expect(subscription.months).to eq(12)
			expect(subscription.campaign_id).to eq(7)
			expect(subscription.recurring).to eq(false)
		end
		it "should build set methods for accessor attributes" do
			subscription = Facilethings::Subscription.new(@client)
			subscription.code = "standard-6"
			subscription.description_es = "Estándar"
			subscription.description_en = "Standard"
			subscription.currency = "EUR"
			subscription.price = 36.0
			subscription.months = 6
			subscription.campaign_id = 7
			subscription.recurring = false

			expect(subscription.code).to eq("standard-6")
			expect(subscription.description_es).to eq("Estándar")
			expect(subscription.description_en).to eq("Standard")
			expect(subscription.currency).to eq("EUR")
			expect(subscription.price).to eq(36.0)
			expect(subscription.months).to eq(6)
			expect(subscription.campaign_id).to eq(7)
			expect(subscription.recurring).to eq(false)
		end
		it "should not build set methods for reader attributes" do
			subscription = Facilethings::Campaign.new(@client)
			
			expect{subscription.id = 4}.to raise_error(NoMethodError)
		end
	end

end