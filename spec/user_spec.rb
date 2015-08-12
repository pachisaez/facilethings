require 'spec_helper'

describe Facilethings::User do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN)
	end

	describe "#attr_reader" do
		it "should build get methods for all attributes" do
			user = Facilethings::User.new(@client, { :id => 1, :language => "es", 
				:time_zone => "Madrid", :info => "Pachi", :mail => "pachisaez@hotmail.com",
				:first_name => "Francisco", :last_name => "Saez", 
				:avatar => { :id => 355, :filename => "avatar.jpg" } })

			expect(user.id).to eq(1)
			expect(user.language).to eq("es")
			expect(user.time_zone).to eq("Madrid")
			expect(user.info).to eq("Pachi")
			expect(user.mail).to eq("pachisaez@hotmail.com")
			expect(user.first_name).to eq("Francisco")
			expect(user.last_name).to eq("Saez")
			expect(user.avatar).to eq({ :id => 355, :filename => "avatar.jpg" })
		end
		it "should not build set methods for reader attributes" do
			user = Facilethings::User.new(@client)
			
			expect{user.id = 2}.to raise_error
			expect{user.language = "en"}.to raise_error
			expect{user.time_zone = "Lisboa"}.to raise_error
			expect{user.info = "Paco"}.to raise_error
			expect{user.mail = "pachisaez@yahoo.es"}.to raise_error
			expect{user.first_name = "Fran"}.to raise_error
			expect{user.last_name = "Saez"}.to raise_error
			expect{user.avatar = { :id => "2" } }.to raise_error
		end
	end

	describe "#avatar_filename" do
		it "should return the URL for the image if exists" do
			user = Facilethings::User.new(@client, { :id => 1, 
				:avatar => { :id => 355, :filename => "avatar.jpg" } })

			expect(user.avatar_filename).to eq("https://s3.amazonaws.com/ft-dev/avatars/355/avatar_thumb.jpg")
		end
		it "should return the default URL if there's no avatar" do
			user = Facilethings::User.new(@client)

			expect(user.avatar_filename).to eq("https://s3.amazonaws.com/ft-dev/default/thumbnail_thumb.png")
		end
  end
end