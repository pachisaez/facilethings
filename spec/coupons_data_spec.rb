require 'spec_helper'

describe Facilethings::CouponsData do
	describe "#convert_to" do
		it "should convert data in one currency to another" do
			data = Facilethings::CouponsData.new(status: "paid", currency: "USD", income: 100.0, commission: 10.0, cleared: 8.0)
			data.convert_to("EUR", 0.5)
			expect(data.currency).to eq "EUR"
			expect(data.income).to eq 50.0
			expect(data.commission).to eq 5.0
			expect(data.cleared).to eq 4.0
		end
	end
end