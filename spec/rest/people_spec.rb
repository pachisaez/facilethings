require 'spec_helper'

describe Facilethings::REST::Person do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN, :endpoint => FT_ENDPOINT)
	end

  describe ".find_person" do
  	before do
    	stub_get('/v1/people/22.json').to_return(:body => fixture('person.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
  	end
    it 'requests the correct resource' do
      person = @client.find_person(22)
      expect(a_get('/v1/people/22.json')).to have_been_made
	    expect(person).to be_a Facilethings::Person
    end
  end

	describe ".find_people" do
  	before do
    	stub_get('/v1/people.json?usn=99&page=1').to_return(:body => fixture('people.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
  	end
    it 'requests the correct resource' do
      data = @client.find_people(99,1)
      expect(a_get('/v1/people.json?usn=99&page=1')).to have_been_made
      expect(data.count).to eq 4
    end
  end

end
