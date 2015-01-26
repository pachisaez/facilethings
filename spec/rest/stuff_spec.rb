require 'spec_helper'

describe Facilethings::REST::Stuff do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN)
	end

  describe ".find_stuff" do
  	before do
    	stub_get('/v1/stuff/32.json').to_return(:body => fixture('stuff.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
  	end
    it 'requests the correct resource' do
      stuff = @client.find_stuff(32)
      expect(a_get('/v1/stuff/32.json')).to have_been_made
	    expect(stuff).to be_a Facilethings::Stuff
    end
  end

	describe ".get_stuff" do
  	before do
    	stub_get('/v1/stuff.json?usn=99&page=1').to_return(:body => fixture('stuff_list.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
  	end
    it 'requests the correct resource' do
      data = @client.get_stuff(99,1)
      expect(a_get('/v1/stuff.json?usn=99&page=1')).to have_been_made
      expect(data.count).to eq 2
    end
  end

end
