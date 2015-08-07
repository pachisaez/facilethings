require 'spec_helper'

describe Facilethings::REST::Ticket do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN)
	end

  describe ".find_tickets" do
  	before do
    	stub_get('/v1/tickets.json').to_return(:body => fixture('tickets.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
  	end
    it 'requests the correct resource' do
      data = @client.find_tickets
      expect(a_get('/v1/tickets.json')).to have_been_made
      expect(data.count).to eq 1
    end
	end

  describe ".find_ticket" do
    before do
      stub_get('/v1/tickets/3001.json').to_return(:body => fixture('ticket.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    it "should return a ticket object" do
      ticket = @client.find_ticket(3001)

      expect(a_get('/v1/tickets/3001.json')).to have_been_made
      expect(ticket).to be_a Facilethings::Ticket
    end
  end

end
