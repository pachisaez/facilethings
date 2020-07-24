require 'spec_helper'

describe Facilethings::User do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN, :endpoint => FT_ENDPOINT)
	end

	describe "#attr_reader" do
		it "should build get methods for all attributes" do
      next_payment = DateTime.now+30.days
			user = Facilethings::User.new(@client, { :id => 1, :language => "es", 
				:time_zone => "Madrid", :info => "Pachi", :mail => "pachisaez@hotmail.com",
				:first_name => "Francisco", :last_name => "Saez", :active => true,
        :next_payment => next_payment, :automated_billing => false,
				:avatar => { :id => 355, :filename => "avatar.jpg" } })

			expect(user.id).to eq(1)
			expect(user.language).to eq("es")
			expect(user.time_zone).to eq("Madrid")
			expect(user.info).to eq("Pachi")
			expect(user.mail).to eq("pachisaez@hotmail.com")
			expect(user.first_name).to eq("Francisco")
			expect(user.last_name).to eq("Saez")
			expect(user.active).to eq(true)
      expect(user.next_payment).to eq(next_payment)
      expect(user.automated_billing).to eq(false)
			expect(user.avatar).to eq({ :id => 355, :filename => "avatar.jpg" })
		end
		it "should not build set methods for reader attributes" do
			user = Facilethings::User.new(@client)
			
			expect{user.id = 2}.to raise_error(NoMethodError)
			expect{user.time_zone = "Lisboa"}.to raise_error(NoMethodError)
			expect{user.info = "Paco"}.to raise_error(NoMethodError)
			expect{user.first_name = "Fran"}.to raise_error(NoMethodError)
			expect{user.last_name = "Saez"}.to raise_error(NoMethodError)
			expect{user.avatar = { :id => "2" } }.to raise_error(NoMethodError)
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

  describe ".cohort_item" do
    before do
      @user = Facilethings::User.new(@client, { :id => 1 }) 
      stub_get("/v1/users/#{@user.id}/cohort_item.json").to_return(:body => fixture('cohort_item.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    it 'requests the correct resource' do
      ci = @user.cohort_item
      expect(a_get("/v1/users/#{@user.id}/cohort_item.json")).to have_been_made
      expect(ci).to be_a Facilethings::CohortItem
      expect(ci.user_id).to eq 1
      expect(ci.cohort_id).to eq 1
      expect(ci.id).to eq 325
      expect(ci.campaign.id).to eq 8
      expect(ci.coupon).to eq nil
    end
  end

	describe ".usage_info" do
    before do
			@user = Facilethings::User.new(@client, { :id => 1 }) 
      stub_get("/v1/users/#{@user.id}/usage.json").to_return(:body => fixture('usage_info.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    it 'requests the correct resource' do
      info = @user.usage_info
      expect(a_get("/v1/users/#{@user.id}/usage.json")).to have_been_made
      expect(info.growth).to eq 4.3
      expect(info.projects).to eq 37
    end
  end

  describe ".weekly_info" do
    before do
      @user = Facilethings::User.new(@client, { :id => 1 }) 
      stub_get("/v1/users/#{@user.id}/weekly_info.json").to_return(:body => fixture('weekly_info.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    it 'requests the correct resource' do
      info = @user.weekly_info
      expect(a_get("/v1/users/#{@user.id}/weekly_info.json")).to have_been_made
      expect(info.collected_stuff).to eq 18
      expect(info.done_stuff).to eq 7
      expect(info.goals.count).to eq 2
    end
  end

	describe ".events" do
    before do
			@user = Facilethings::User.new(@client, { :id => 1 }) 
      stub_get("/v1/users/#{@user.id}/events.json").to_return(:body => fixture('events_data.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    it 'requests the correct resource' do
      data = @user.events
      expect(a_get("/v1/users/#{@user.id}/events.json")).to have_been_made
      expect(data.count).to eq 4
    end
  end

	describe ".send_confirm" do
    before do
			@user = Facilethings::User.new(@client, { :id => 1 }) 
      stub_get("/v1/users/#{@user.id}/send_confirm.json").to_return(:body => fixture('ok.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    it 'requests the correct resource' do
      result = @user.send_confirm
      expect(a_get("/v1/users/#{@user.id}/send_confirm.json")).to have_been_made
      expect(result).to eq(true)
    end
  end

  describe ".cancel" do
    before do
			@user = Facilethings::User.new(@client, { :id => 1 }) 
      stub_put('/v1/users/1/cancel.json', false).to_return(:status => 200, :body => fixture('ok.json'), :headers => {})
    end
    it 'cancel the account' do
    	result = @user.cancel
      expect(a_put('/v1/users/1/cancel.json')).to have_been_made
      expect(result).to eq(true)
    end
  end

  describe ".activate" do
    before do
			@user = Facilethings::User.new(@client, { :id => 1 }) 
      stub_put('/v1/users/1/activate.json', false).to_return(:status => 200, :body => fixture('ok.json'), :headers => {})
    end
    it 'activate the account' do
    	result = @user.activate
      expect(a_put('/v1/users/1/activate.json')).to have_been_made
      expect(result).to eq(true)
    end
  end

  describe ".remove" do
    before do
			@user = Facilethings::User.new(@client, { :id => 1 }) 
      stub_delete('/v1/users/1/remove.json').to_return(:status => 200, :body => fixture('ok.json'), :headers => {})
    end
    it 'remove the account' do
    	result = @user.remove
      expect(a_delete('/v1/users/1/remove.json')).to have_been_made
      expect(result).to eq(true)
    end
  end

end