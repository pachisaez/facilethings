require 'spec_helper'

describe Facilethings::REST::Client do
  describe '.new' do
   	context 'when invalid credentials are provided' do
      it 'raises a NoMethodError exception' do
        expect { Facilethings::REST::Client.new(:foo => "bar") }.to raise_exception(NoMethodError)
      end
    end

    context 'when no credentials are provided' do
      it 'does not raise an exception' do
        expect { Facilethings::REST::Client.new }.not_to raise_error
      end
    end

    context 'when no end point is provided' do
      it 'shows a default end point' do
      	client = Facilethings::REST::Client.new
      	expect(client.endpoint).to eq(Facilethings::Client::URL_PREFIX)
      end
    end

    context 'when a new end point is provided' do
      it 'shows the new end point' do
	      client = Facilethings::REST::Client.new(:endpoint => "EP")
      	expect(client.endpoint).to eq("EP")
      end
    end
  end

  describe '.credentials?' do
    it 'returns true if all OAuth2 credentials are present' do
      client = Facilethings::REST::Client.new(:key => 'K', :secret => 'S', :token => 'T')
      expect(client.credentials?).to be true
    end
  end

  describe ".get" do
    context 'when credentials are ok' do
      it "gets a JSON hash" do
        client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, 
        	:endpoint => FT_ENDPOINT, :token =>  MY_ACCESS_TOKEN)
        stub_get('/v1/users.json').to_return(:body => fixture('user.json'))
        expect(client.get("/v1/users.json")).to be_a Hash
      end
    end
    context 'when invalid credentials are provided' do
      it 'raises an OAuth2 exception' do
        client = Facilethings::REST::Client.new(:key => 'K', :secret => 'S', :token => 'T', 
          :endpoint => FT_ENDPOINT)
        stub_get('/v1/users.json').
          with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>'Bearer T', 'User-Agent'=>"#{USER_AGENT}" }).
          to_return(:status => 500, :body => "", :headers => {})
        expect { client.get("/v1/users.json") }.to raise_exception(OAuth2::Error)
      end
    end
  end
end
