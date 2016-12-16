require 'spec_helper'

describe Facilethings::REST::Campaign do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN, :endpoint => FT_ENDPOINT)
	end

  describe ".find_campaign_by_code" do
  	before do
    	stub_get("/v1/campaigns/xmas.json").to_return(:body => fixture('campaign.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
  	end
    it 'requests the correct resource' do
      campaign = @client.find_campaign_by_code('xmas')
      expect(a_get("/v1/campaigns/xmas.json")).to have_been_made
      expect(campaign.code).to eq 'xmas'
    end
	end

end
