require 'spec_helper'

describe Facilethings::Campaign do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN, :endpoint => FT_ENDPOINT)
	end

	describe "#attr_reader and #attr_accessor" do
		it "should build get methods for all attributes" do
			campaign = Facilethings::Campaign.new(@client, { :id => 7, :created_at => DateTime.now,
				:code => "xmas", :finishes_at => DateTime.now+15.days, :description_es => "Navidad",
				:description_en => "Christmas" })
			expect(campaign.id).to eq(7)
			expect(campaign.created_at).to be_a DateTime
			expect(campaign.finishes_at).to be_a DateTime
			expect(campaign.code).to eq("xmas")
			expect(campaign.description_es).to eq("Navidad")
			expect(campaign.description_en).to eq("Christmas")
		end
		it "should build set methods for accessor attributes" do
			campaign = Facilethings::Campaign.new(@client)
			campaign.code = "xmas"
			campaign.description_es = "Navidad"
			campaign.description_en = "Christmas"
			campaign.recurring = false

			expect(campaign.code).to eq("xmas")
			expect(campaign.description_es).to eq("Navidad")
			expect(campaign.description_en).to eq("Christmas")
			expect(campaign.recurring).to eq(false)
		end
		it "should not build set methods for reader attributes" do
			campaign = Facilethings::Campaign.new(@client)
			
			expect{campaign.id = 4}.to raise_error(NoMethodError)
		end
	end

end