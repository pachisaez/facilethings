require 'spec_helper'

describe Facilethings::Stuff do
	before(:each) do
    @client = Facilethings::REST::Client.new(:key => FT_KEY, :secret => FT_SECRET, :token =>  MY_ACCESS_TOKEN)
	end

	describe "#attr_reader and #attr_accessor" do
		it "should build get methods for all attributes" do
			stuff = Facilethings::Stuff.new(@client, { :id => 32, :created_at => DateTime.now,
				:text => "this is a new task", :state => 0, :finished => 0 })

			expect(stuff.id).to eq(32)
			expect(stuff.created_at).to be_a DateTime
			expect(stuff.text).to eq("this is a new task")
			expect(stuff.state).to eq(0)
			expect(stuff.finished).to eq(0)
		end
		it "should build set methods for accessor attributes" do
			stuff = Facilethings::Stuff.new(@client)
			stuff.text = "this is a new task"
			stuff.state = 0
			stuff.finished = 0

			expect(stuff.text).to eq("this is a new task")
			expect(stuff.state).to eq(0)
			expect(stuff.finished).to eq(0)
		end
		it "should not build set methods for reader attributes" do
			stuff = Facilethings::Stuff.new(@client)
			
			expect{stuff.id = 4}.to raise_error
			expect{stuff.created_at = DateTime.now}.to raise_error
		end
	end

end