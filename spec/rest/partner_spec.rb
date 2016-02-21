require 'spec_helper'

describe Facilethings::REST::Partner do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN, :endpoint => FT_ENDPOINT)
	end

  describe ".find_partner" do
  	before do
    	stub_get('/v1/partners.json').to_return(:body => fixture('partner.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
  	end
    it 'requests the correct resource' do
      partner = @client.find_partner
      expect(a_get('/v1/partners.json')).to have_been_made
      expect(partner.id).to eq 24
    end
    context "user is not a partner" do
      before do
        stub_get('/v1/partners.json').to_return(:body => fixture('error.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
      end
      it "no parner class should be created" do
        expect { @client.find_partner }.to raise_error(Facilethings::Error)
      end
    end
  end


end
