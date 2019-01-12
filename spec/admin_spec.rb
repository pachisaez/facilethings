require 'spec_helper'

describe Facilethings::Admin do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN, :endpoint => FT_ENDPOINT)
	end

	describe "#attr_reader and #attr_accessor" do
		it "should build get methods for all attributes" do
			admin = Facilethings::Admin.new(@client, { :id => 1, :blog_post => "the-post",
				:blog_title_en => "The English Title", :blog_title_es => "El título español" })

			expect(admin.id).to eq(1)
			expect(admin.blog_post).to eq("the-post")
			expect(admin.blog_title_en).to eq("The English Title")
 			expect(admin.blog_title_es).to eq("El título español")
		end
		it "should build set methods for accessor attributes" do
			admin = Facilethings::Admin.new(@client)
			admin.blog_post = "the-post"
			admin.blog_title_en = "The English Title"
			admin.blog_title_es = "El título español"

			expect(admin.blog_post).to eq("the-post")
			expect(admin.blog_title_en).to eq("The English Title")
 			expect(admin.blog_title_es).to eq("El título español")
		end
		it "should not build set methods for reader attributes" do
			admin = Facilethings::Admin.new(@client)
			
			expect{admin.id = 4}.to raise_error(NoMethodError)
		end
	end
  
  describe ".refresh_latest_post" do
    before do
      stub_get('/v1/admin/expire_cache').to_return(:body => fixture('ok.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    it "should return ok" do
      admin = Facilethings::Admin.new(@client, { :id => 1})
      result = admin.refresh_latest_post

      expect(a_get('/v1/admin/expire_cache')).to have_been_made 
      expect(result).to eq(true)
    end
  end

end