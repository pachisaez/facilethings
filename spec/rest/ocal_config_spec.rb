require 'spec_helper'

describe Facilethings::REST::OcalConfig do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN, :endpoint => FT_ENDPOINT)
	end

  describe ".find_ocal_configs" do
    it 'requests the correct resource' do
      stub_get('/v1/ocal_configs.json').to_return(:body => fixture('ocal_configs.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
      subscriptions = @client.find_ocal_configs
      expect(a_get('/v1/ocal_configs.json')).to have_been_made
      expect(subscriptions).to be_a Array
      expect(subscriptions.count).to eq 2
      expect(subscriptions[0]).to be_a Facilethings::OcalConfig
    end    
    it 'requests the correct resource, with conditions' do
      stub_get("/v1/ocal_configs.json?query=subscription_expiration<'2019-12-15'").to_return(:body => fixture('ocal_configs.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
      channels = @client.find_ocal_configs("query=subscription_expiration<'2019-12-15'")
      expect(a_get("/v1/ocal_configs.json?query=subscription_expiration<'2019-12-15'")).to have_been_made
    end    
  end
end
