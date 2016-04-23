require 'spec_helper'

describe Facilethings::CohortEvent do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN, :endpoint => FT_ENDPOINT)
	end

	describe "#attr_reader and #attr_accessor" do
		it "should build get methods for all attributes" do
			event = Facilethings::CohortEvent.new(@client, { :id => 2, :created_at => DateTime.now,
				:cohort_item_id => 1, :event_id => 4, :revenue => 36.0, :checked => true, :currency => "EUR",
				:event => { :id => 4, :name => "pay" } })

			expect(event.id).to eq(2)
			expect(event.created_at).to be_a DateTime
			expect(event.cohort_item_id).to eq 1
			expect(event.revenue).to eq 36.0
			expect(event.checked).to eq true
			expect(event.currency).to eq "EUR"
			expect(event.event).to be_a Facilethings::Event
			expect(event.event.name).to eq "pay"
		end
		it "should not build set methods for reader attributes" do
			coupon = Facilethings::CohortEvent.new(@client)
			
			expect{event.id = 4}.to raise_error
			expect{event.created_at = DateTime.now}.to raise_error
			expect{event.cohort_item_id = 1}.to raise_error
			expect{event.revenue = 36.0}.to raise_error
			expect{event.checked = true}.to raise_error
			expect{event.event_id = 4}.to raise_error
			expect{event.currency = "EUR"}.to raise_error
		end
	end

end