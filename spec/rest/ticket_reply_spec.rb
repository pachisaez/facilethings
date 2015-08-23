require 'spec_helper'

describe Facilethings::REST::TicketReply do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN)
	end

  describe ".new_ticket" do
    it "should return a new, initialized ticket_reply object" do
      reply = @client.new_ticket({ :ticket_id => 102, :user_id => 1 })

      expect(reply).to be_a Facilethings::TicketReply
			expect(reply.ticket_id).to eq(102)
			expect(reply.user_id).to eq(1)
    end
  end
end
