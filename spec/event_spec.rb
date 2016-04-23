require 'spec_helper'

describe Facilethings::Event do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN, :endpoint => FT_ENDPOINT)
	end

	describe "#attr_reader and #attr_accessor" do
		it "should build get methods for all attributes" do
			event = Facilethings::Event.new(@client, { :id => 2, :created_at => DateTime.now,
				:name => "pay", :description => "this guy paid!" })

			expect(event.id).to eq(2)
			expect(event.created_at).to be_a DateTime
			expect(event.name).to eq "pay"
			expect(event.description).to eq "this guy paid!"
		end
		it "should not build set methods for reader attributes" do
			event = Facilethings::Event.new(@client)
			
			expect{event.id = 4}.to raise_error
			expect{event.created_at = DateTime.now}.to raise_error
			expect{event.name = "pay"}.to raise_error
			expect{event.description = "client"}.to raise_error
		end
	end

end