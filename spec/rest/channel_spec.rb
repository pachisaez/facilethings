require 'spec_helper'

describe Facilethings::REST::Channel do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN, :endpoint => FT_ENDPOINT)
	end

  describe ".find_channels" do
    it 'requests the correct resource' do
      stub_get('/v1/gcal_configs.json').to_return(:body => fixture('channels.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
      channels = @client.find_channels
      expect(a_get('/v1/gcal_configs.json')).to have_been_made
      expect(channels).to be_a Array
      expect(channels.count).to eq 2
      expect(channels[0]).to be_a Facilethings::Channel
    end    
    it 'requests the correct resource, with conditions' do
      stub_get("/v1/gcal_configs.json?channel_expiration<2017-12-15").to_return(:body => fixture('channels.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
      channels = @client.find_channels("channel_expiration<2017-12-15")
      expect(a_get("/v1/gcal_configs.json?channel_expiration<2017-12-15")).to have_been_made
    end    
  end
end
