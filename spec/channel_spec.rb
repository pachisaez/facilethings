require 'spec_helper'

describe Facilethings::Channel do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN, :endpoint => FT_ENDPOINT)
	end

	describe "#attr_reader and #attr_accessor" do
		it "should build get method for id" do
			channel = Facilethings::Channel.new(@client, { :id => 44 })
			expect(channel.id).to eq(44)
		end
	end

  describe ".restart" do
    before do
			@channel = Facilethings::Channel.new(@client, { :id => 44 })

      stub_put('/v1/gcal_configs/44/restart.json', false).to_return(:status => 200, :body => fixture("ok.json"), :headers => {})
    end
    it 'restarts the channel' do
    	@channel.restart
      expect(a_put('/v1/gcal_configs/44/restart.json')).to have_been_made
    end
  end


end