require 'spec_helper'

describe Facilethings::Base do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN)
	end

	describe "#save" do
		it "should do a POST rest api call if it's a new item" do
      stub_post('/v1/coupons.json')
      	.with(:body => {"coupon"=>{"amount"=>"6", "code"=>"CODE", "discount"=>"20.0", "note"=>"note"}})
				.to_return(:body => fixture('saved.json'), :headers => {:content_type => 'application/json; charset=utf-8'})			
			coupon = Facilethings::Coupon.new(@client, { :code => "CODE", :note => "note", 
				:amount => 6, :discount => 20.0 })
			coupon.save
      expect(a_post('/v1/coupons.json')).to have_been_made
		end
		it "should update the ID if it's a new item" do
      stub_post('/v1/coupons.json')
      	.with(:body => {"coupon"=>{"amount"=>"6", "code"=>"CODE", "discount"=>"20.0", "note"=>"note"}})
				.to_return(:body => fixture('saved.json'), :headers => {:content_type => 'application/json; charset=utf-8'})			
			coupon = Facilethings::Coupon.new(@client, { :code => "CODE", :note => "note", 
				:amount => 6, :discount => 20.0 })
			coupon.save
      expect(coupon.id).to eq(14)
		end
		it "should do a PUT rest api call if it's a existing item" do
      stub_put('/v1/coupons/2.json')
      	.with(:body => {"coupon"=>{"id" => "2", "amount"=>"6", "code"=>"CODE", "discount"=>"20.0", "note"=>"note"}})
				.to_return(:body => fixture('saved.json'), :headers => {:content_type => 'application/json; charset=utf-8'})			
			coupon = Facilethings::Coupon.new(@client, { :id => 2, :code => "CODE", :note => "note", 
				:amount => 6, :discount => 20.0 })
			coupon.save
      expect(a_put('/v1/coupons/2.json')).to have_been_made
		end
	end

	describe "#destroy" do
		it "should do a DELETE rest api call" do
      stub_delete('/v1/coupons/2.json')
				.to_return(:body => fixture('saved.json'), :headers => {:content_type => 'application/json; charset=utf-8'})			
			coupon = Facilethings::Coupon.new(@client, { :id => 2, :code => "CODE", :note => "note", 
				:amount => 6, :discount => 20.0 })
			coupon.destroy
      expect(a_delete('/v1/coupons/2.json')).to have_been_made
		end
	end

	describe "#rest_path" do
		it "should return the proper V1 rest api url with id" do
			coupon = Facilethings::Coupon.new(@client, { :id => 2 })
			path = coupon.send(:rest_path)
			expect(path).to eq("/v1/coupons/2.json")
		end
		it "should return the proper V1 rest api url with no id" do
			coupon = Facilethings::Coupon.new(@client)
			path = coupon.send(:rest_path)
			expect(path).to eq("/v1/coupons.json")
		end
	end

	describe "#extract_body" do
		it "should return a proper Hash body with all the attributes" do
			coupon = Facilethings::Coupon.new(@client, { :id => 2, :created_at => "today",
				:code => "CODE", :note => "note", :amount => 6, :discount => 20.0 })
			body = coupon.send(:extract_body)
			expect(body).to match({ :body => { :coupon => 
				{ :id=>2, :created_at=>"today", :code=>"CODE", :note=>"note", :amount=>6, :discount=>20.0 }}})
		end
	end

end
