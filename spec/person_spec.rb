require 'spec_helper'

describe Facilethings::Person do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN, :endpoint => FT_ENDPOINT)
	end

	describe "#attr_reader and #attr_accessor" do
		it "should build get methods for all attributes" do
			person = Facilethings::Person.new(@client, { :id => 22, :created_at => DateTime.now,
				:name => "pachi", :status => 1 })

			expect(person.id).to eq(22)
			expect(person.created_at).to be_a DateTime
			expect(person.name).to eq("pachi")
			expect(person.status).to eq(1)
		end
		it "should build set methods for accessor attributes" do
			person = Facilethings::Person.new(@client)
			person.name = "pachi"

			expect(person.name).to eq("pachi")
		end
		it "should not build set methods for reader attributes" do
			person = Facilethings::Person.new(@client)
			
			expect{person.id = 4}.to raise_error
			expect{person.statu = 1}.to raise_error
		end
	end

end