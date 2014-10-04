require 'spec_helper'

describe Facilethings::REST::Partner do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN)
	end

  describe ".partner" do
  	before do
    	stub_get('/v1/partners.json').to_return(:body => fixture('partner.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
  	end
    it 'requests the correct resource' do
      @client.partner
      expect(a_get('/v1/partners.json')).to have_been_made
    end
    context "user is a partner" do
      it "should be me" do
  	  	partner = @client.partner
        expect(partner.user_id).to eq 1
      end
    end
    context "user is not a partner" do
      before do
        stub_get('/v1/partners.json').to_return(:body => fixture('error.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
      end
      it "no parner class should be created" do
        expect { @client.partner }.to raise_error(Facilethings::Error)
      end
    end
  end

  describe ".traffic" do
    before do
      stub_get('/v1/partners/24/traffic.json').to_return(:body => fixture('traffic.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    it 'requests the correct resource' do
      data = @client.traffic(24)
      expect(a_get('/v1/partners/24/traffic.json')).to have_been_made
      expect(data.count).to eq 2
    end
  end

end
