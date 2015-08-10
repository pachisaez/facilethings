require 'spec_helper'

describe Facilethings::Ticket do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN)
	end

	describe "#attr_reader and #attr_accessor" do
		it "should build get methods for all attributes" do
			ticket = Facilethings::Ticket.new(@client, { :id => 2, :created_at => DateTime.now,
				:detail => "detail", :language => "en", :state => 0, :user_id => 1, :closed_at => nil,
				:user => { :id => 1 } })

			expect(ticket.id).to eq(2)
			expect(ticket.created_at).to be_a DateTime
			expect(ticket.detail).to eq("detail")
			expect(ticket.language).to eq("en")
			expect(ticket.state).to eq(0)
			expect(ticket.user_id).to eq(1)
			expect(ticket.closed_at).to be_nil
			expect(ticket.user).to be_a Facilethings::User
		end
		it "should build set methods for accessor attributes" do
			ticket = Facilethings::Ticket.new(@client)
			ticket.state = 5
			ticket.closed_at = DateTime.now

			expect(ticket.state).to eq(5)
			expect(ticket.closed_at).to be_a DateTime
		end
		it "should not build set methods for reader attributes" do
			ticket = Facilethings::Ticket.new(@client)
			
			expect{ticket.id = 4}.to raise_error
			expect{ticket.created_at = DateTime.now}.to raise_error
			expect{ticket.detail = "updated"}.to raise_error
			expect{ticket.language = "de"}.to raise_error
			expect{ticket.user_id = 2}.to raise_error
			expect{ticket.user = Facilethings::User.new(@client)}.to raise_error
		end
	end

	describe ".replies" do
    before do
			@ticket = Facilethings::Ticket.new(@client, { :id => 593, :created_at => DateTime.now,
				:detail => "detail", :language => "en", :state => 0, :user_id => 1, :closed_at => nil,
				:user => { :id => 1 } })

      stub_get('/v1/tickets/593/ticket_replies.json').to_return(:body => fixture('ticket_replies.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    it 'get the whole conversation' do
      replies = @ticket.replies
      expect(a_get('/v1/tickets/593/ticket_replies.json')).to have_been_made
      expect(replies.count).to eq 2
    end
  end
end