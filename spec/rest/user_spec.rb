require 'spec_helper'

describe Facilethings::REST::User do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN, :endpoint => FT_ENDPOINT)
	end

  describe ".find_user" do
  	before do
    	stub_get('/v1/users/1.json').to_return(:body => fixture('user.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
  	end
    it 'requests the correct resource' do
      user = @client.find_user(1)
      expect(a_get('/v1/users/1.json')).to have_been_made
      expect(user).to be_a Facilethings::User
      expect(user.id).to eq 1
	  end
	end

end
