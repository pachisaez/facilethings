require 'spec_helper'

describe Facilethings::REST::Stuff do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN, :endpoint => FT_ENDPOINT)
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

  describe ".search_stuff_by_state" do
    before do
      stub_get("/v1/stuff/search_by_state.json?user_id=1&state=0&conditions=reminder<'2017-10-01'").to_return(:body => fixture('stuff_list.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    it 'requests the correct resource and return the proper values' do
      stuff = @client.search_stuff_by_state(1, 0, "reminder<'2017-10-01'")
      expect(a_get("/v1/stuff/search_by_state.json?user_id=1&state=0&conditions=reminder<'2017-10-01'")).to have_been_made

      expect(stuff).to be_a Array
      expect(stuff.count).to eq 2

      st = stuff[0]

      expect(st).to be_a Facilethings::Stuff
      expect(st.reminder).to be_a DateTime
      expect(st.project).to be_a Facilethings::Project
      expect(st.project.name).to eq "project 34"
      expect(st.checkpoints).to be_a Array
      expect(st.checkpoints.count).to eq 2

      cp = st.checkpoints[0]
      expect(cp.description).to eq "kitchen"

      st = stuff[1]
      expect(st.checkpoints.count).to eq 0
      expect(st.project).to be_nil
    end
  end

end
