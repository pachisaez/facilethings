require 'spec_helper'

describe Facilethings::REST::Subscription do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN, :endpoint => FT_ENDPOINT)
	end

  describe ".find_subscription_by_code" do
  	before do
    	stub_get("/v1/subscriptions/standard.json").to_return(:body => fixture('subscription.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
  	end
    it 'requests the correct resource' do
      subscription = @client.find_subscription_by_code('standard')
      expect(a_get("/v1/subscriptions/standard.json")).to have_been_made
      expect(subscription.code).to eq 'standard'
    end
	end

end
