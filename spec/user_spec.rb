require 'spec_helper'

describe Facilethings::User do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN)
	end

	describe "#attr_reader" do
		it "should build get methods for all attributes" do
			user = Facilethings::User.new(@client, { :id => 1, :language => "es", 
				:time_zone => "Madrid", :info => "Pachi", :mail => "pachisaez@hotmail.com" })

			expect(user.id).to eq(1)
			expect(user.language).to eq("es")
			expect(user.time_zone).to eq("Madrid")
			expect(user.info).to eq("Pachi")
			expect(user.mail).to eq("pachisaez@hotmail.com")
		end
		it "should not build set methods for reader attributes" do
			user = Facilethings::User.new(@client)
			
			expect{user.id = 2}.to raise_error
			expect{user.language = "en"}.to raise_error
			expect{user.time_zone = "Lisboa"}.to raise_error
			expect{user.info = "Paco"}.to raise_error
			expect{user.mail = "pachisaez@yahoo.es"}.to raise_error
		end
	end
end