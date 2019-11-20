require 'spec_helper'

describe Facilethings::OcalConnection do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN, :endpoint => FT_ENDPOINT)
	end

  describe ".renew" do
    before do
			@subscription = Facilethings::OcalConnection.new(@client, { :id => 44 })

      stub_put('/v1/ocal_connections/44/renew_subscription.json', false).to_return(:status => 200, :body => fixture("ok.json"), :headers => {})
    end
    it 'renew the subscription' do
    	@subscription.renew
      expect(a_put('/v1/ocal_connections/44/renew_subscription.json')).to have_been_made
    end
  end


end