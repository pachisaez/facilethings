require 'spec_helper'

describe Facilethings::TicketFile do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN)

		@file = Facilethings::TicketFile.new(@client, { :id => 6, :ticket_id => 1, 
			:created_at => DateTime.now, :filename => "sketch.jpg" })
	end

	describe "#attr_reader" do
		it "should build get methods for all attributes" do
			expect(@file.id).to eq(6)
			expect(@file.created_at).to be_a DateTime
			expect(@file.filename).to eq("sketch.jpg")
			expect(@file.ticket_id).to eq(1)
		end
		it "should not build set methods for reader attributes" do
			expect{@file.id = 4}.to raise_error
			expect{@file.created_at = DateTime.now}.to raise_error
			expect{@file.filename = "other.png"}.to raise_error
			expect{@file.ticket_id = 2}.to raise_error
		end
	end

	describe ".url" do
		it "should return the URL for the file" do
			expect(@file.url).to eq("https://s3.amazonaws.com/ft-dev/ticket_files/6/sketch.jpg")
		end
  end

end