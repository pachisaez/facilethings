require 'spec_helper'

describe Facilethings::REST::Admin do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN, :endpoint => FT_ENDPOINT)
	end

  describe ".find_admin" do
  	before do
    	stub_get('/v1/admin.json').to_return(:body => fixture('admin.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
  	end
    it 'requests the correct resource' do
      admin = @client.find_admin
      expect(a_get('/v1/admin.json')).to have_been_made
      expect(admin).to be_a Facilethings::Admin
      expect(admin.id).to eq 1
	  end
	end

end
