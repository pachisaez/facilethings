require 'spec_helper'

describe Facilethings::Ticket do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN)
	end

	describe "#attr_reader and #attr_accessor" do
		it "should build get methods for all attributes" do
			ticket = Facilethings::Ticket.new(@client, { :id => 2, :created_at => DateTime.now,
				:detail => "detail", :language => "en", :state => 0, :user_id => 1, :closed_at => nil })

			expect(ticket.id).to eq(2)
			expect(ticket.created_at).to be_a DateTime
			expect(ticket.detail).to eq("detail")
			expect(ticket.language).to eq("en")
			expect(ticket.state).to eq(0)
			expect(ticket.user_id).to eq(1)
			expect(ticket.closed_at).to be_nil
		end
		it "should build set methods for accessor attributes" do
			ticket = Facilethings::Ticket.new(@client)
			ticket.state = 5
			ticket.closed_at = DateTime.now

			expect(ticket.state).to eq(5)
			expect(ticket.closed_at).to be_a DateTime
		end
		it "should not build set methods for reader attributes" do
			ticket = Facilethings::Coupon.new(@client)
			
			expect{ticket.id = 4}.to raise_error
			expect{ticket.created_at = DateTime.now}.to raise_error
			expect{ticket.detail = "updated"}.to raise_error
			expect{ticket.lagunage = "de"}.to raise_error
			expect{ticket.user_id = 2}.to raise_error
		end
	end

end