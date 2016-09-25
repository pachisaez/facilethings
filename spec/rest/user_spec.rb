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

  describe ".find_user_by_email" do
    before do
      stub_get('/v1/users/me.json?email=pachisaez@hotmail.com').to_return(:body => fixture('user.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    it 'requests the correct resource' do
      user = @client.find_user_by_email("pachisaez@hotmail.com")
      expect(a_get('/v1/users/me.json?email=pachisaez@hotmail.com')).to have_been_made
      expect(user).to be_a Facilethings::User
      expect(user.id).to eq 1
    end
  end

  describe ".find_users" do
    it 'requests the correct resource' do
      stub_get('/v1/users/all.json').to_return(:body => fixture('users.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
      users = @client.find_users
      expect(a_get('/v1/users/all.json')).to have_been_made
      expect(users).to be_a Array
      expect(users.count).to eq 5
      expect(users[0]).to be_a Facilethings::User
    end    
    it 'requests the correct resource, with conditions' do
      stub_get("/v1/users/all.json?active=true&notifications=true").to_return(:body => fixture('users.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
      users = @client.find_users("active=true&notifications=true")
      expect(a_get("/v1/users/all.json?active=true&notifications=true")).to have_been_made
    end    
  end

end
