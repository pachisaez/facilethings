require 'spec_helper'

describe Facilethings::TicketReply do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN, :endpoint => FT_ENDPOINT)
	end

	describe "#attr_reader and #attr_accessor" do
		it "should build get methods for all attributes" do
			reply = Facilethings::TicketReply.new(@client, { :id => 6, :ticket_id => 1, :created_at => DateTime.now,
				:detail => "detail", :user_id => 1,
				:user => { :id => 1 } })

			expect(reply.id).to eq(6)
			expect(reply.created_at).to be_a DateTime
			expect(reply.detail).to eq("detail")
			expect(reply.user_id).to eq(1)
			expect(reply.user).to be_a(Facilethings::User)
		end
		it "should build set methods for accessor attributes" do
			reply = Facilethings::TicketReply.new(@client)
			reply.detail = "detail updated"
	
			expect(reply.detail).to eq("detail updated")
		end
		it "should not build set methods for reader attributes" do
			reply = Facilethings::TicketReply.new(@client)
			
			expect{reply.id = 4}.to raise_error
			expect{reply.created_at = DateTime.now}.to raise_error
			expect{reply.user_id = 2}.to raise_error
			expect{reply.user = Facilethings::User.new(@client)}.to raise_error
		end
	end

end