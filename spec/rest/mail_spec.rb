require 'spec_helper'

describe Facilethings::REST::Mail do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN, :endpoint => FT_ENDPOINT)
	end

  describe ".find_email" do
    before do
      stub_get('/v1/mails/14.json').to_return(:body => fixture('mail.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    it "should return the mail identified" do
      mail = @client.find_email(14)

      expect(a_get('/v1/mails/14.json')).to have_been_made
      expect(mail).to be_a Facilethings::Mail
    end
  end

  describe ".find_email_by_email" do
    before do
      stub_get('/v1/mails.json?email=pachisaez@hotmail.com').to_return(:body => fixture('mail.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    it "should return the mail identified by email address" do
      mail = @client.find_email_by_email("pachisaez@hotmail.com")

      expect(a_get('/v1/mails.json?email=pachisaez@hotmail.com')).to have_been_made
      expect(mail).to be_a Facilethings::Mail
    end
  end

end
