require 'spec_helper'

describe Facilethings::Coupon do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN, :endpoint => FT_ENDPOINT)
	end

	describe "#attr_reader and #attr_accessor" do
		it "should build get methods for all attributes" do
			coupon = Facilethings::Coupon.new(@client, { :id => 2, :created_at => DateTime.now,
				:code => "CODE", :note => "note", :amount => 6, :discount => 20.0 })

			expect(coupon.id).to eq(2)
			expect(coupon.created_at).to be_a DateTime
			expect(coupon.code).to eq("CODE")
			expect(coupon.note).to eq("note")
			expect(coupon.amount).to eq(6)
			expect(coupon.discount).to eq(20.0)
		end
		it "should build set methods for accessor attributes" do
			coupon = Facilethings::Coupon.new(@client)
			coupon.code = "CODE"
			coupon.note = "note"
			coupon.amount = 6
			coupon.discount = 20.0

			expect(coupon.code).to eq("CODE")
			expect(coupon.note).to eq("note")
			expect(coupon.amount).to eq(6)
			expect(coupon.discount).to eq(20.0)
		end
		it "should not build set methods for reader attributes" do
			coupon = Facilethings::Coupon.new(@client)
			
			expect{coupon.id = 4}.to raise_error
			expect{coupon.created_at = DateTime.now}.to raise_error
		end
	end

end