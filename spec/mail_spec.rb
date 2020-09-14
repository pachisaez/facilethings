require 'spec_helper'

describe Facilethings::Mail do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN, :endpoint => FT_ENDPOINT)
	end

	describe "#attr_reader and #attr_accessor" do
		it "should build get methods for all attributes" do
			mail = Facilethings::Mail.new(@client, { :id => 2, :created_at => DateTime.now,
				:mail => "pachisaez@hotmail.com", :marked => false, :language => "es", :was_client => true,
				:first_name => "Pachi" })

			expect(mail.id).to eq(2)
			expect(mail.created_at).to be_a DateTime
			expect(mail.mail).to eq("pachisaez@hotmail.com")
			expect(mail.first_name).to eq("Pachi")
			expect(mail.language).to eq("es")
			expect(mail.marked).to eq(false)
			expect(mail.was_client).to eq(true)
		end
		it "should build set methods for accessor attributes" do
			mail = Facilethings::Mail.new(@client)
			mail.mail = "pachisaez@hotmail.com"
			mail.first_name = "Pachi"
			mail.language = "es"
			mail.marked = true

			expect(mail.mail).to eq("pachisaez@hotmail.com")
			expect(mail.first_name).to eq("Pachi")
			expect(mail.language).to eq("es")
			expect(mail.marked).to eq(true)
		end
		it "should not build set methods for reader attributes" do
			mail = Facilethings::Mail.new(@client)
			
			expect{mail.id = 4}.to raise_error(NoMethodError)
			expect{mail.created_at = DateTime.now}.to raise_error(NoMethodError)
			expect{mail.was_client = true}.to raise_error(NoMethodError)
		end
	end

end