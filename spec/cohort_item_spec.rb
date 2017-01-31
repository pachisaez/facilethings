require 'spec_helper'

describe Facilethings::CohortItem do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN, :endpoint => FT_ENDPOINT)
	end

	describe "#attr_reader and #attr_accessor" do
		it "should build get methods for all attributes" do
			item = Facilethings::CohortItem.new(@client, { :id => 2, :created_at => DateTime.now,
				:cohort_id => 1, :user_id => 4, :revenue => 36.0, :source => nil })

			expect(item.id).to eq(2)
			expect(item.created_at).to be_a DateTime
			expect(item.cohort_id).to eq 1
			expect(item.revenue).to eq 36.0
			expect(item.user_id).to eq 4
			expect(item.source).to eq nil
			expect(item.campaign).to eq nil
			expect(item.coupon).to eq nil
		end
		it "should not build set methods for reader attributes" do
			item = Facilethings::CohortItem.new(@client)
			
			expect{item.id = 4}.to raise_error
			expect{item.created_at = DateTime.now}.to raise_error
			expect{item.cohort_id = 1}.to raise_error
			expect{item.user_id = 4}.to raise_error
			expect{item.source = "hola"}.to raise_error
		end
	end

end