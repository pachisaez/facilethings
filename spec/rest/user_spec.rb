require 'spec_helper'

describe Facilethings::REST::User do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN)
	end

  describe ".user" do
  	before do
    	stub_get('/v1/users.json').to_return(:body => fixture('user.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
  	end
    it 'requests the correct resource' do
      @client.user
      expect(a_get('/v1/users.json')).to have_been_made
    end
	  it "should be a Facilethings::User class" do
      expect(@client.user).to be_a Facilethings::User
	  end
	  it "should be me" do
	  	user = @client.user
      expect(user.id).to eq 1
	  end
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

end
