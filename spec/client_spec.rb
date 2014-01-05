require 'spec_helper'

describe "Facilethings::Client" do  
  Facilethings::Configuration::VALID_OPTIONS_KEYS.each do |key|
    describe ".#{key}" do
			client = Facilethings::Client.new
      it 'should return the default value' do
        client.send(key).should == Facilethings::Configuration.const_get("DEFAULT_#{key.upcase}")
      end
    end
  end
 
  describe ".new" do
  	after(:each) { Facilethings.reset }
  	Facilethings::Configuration::VALID_CONFIG_KEYS.each do |key|
		  it "should set the #{key}" do
		  	client = Facilethings::Client.new key => key
		  	client.send("#{key}").should == key
	    end
	  end
  end

  describe ".get" do
    context 'when credentials are ok' do
      it "gets a JSON hash" do
        client = Facilethings::Client.new GOOD_CREDENTIALS
        expect(client.user).to be_a Hash
      end
    end
    context 'when invalid credentials are provided' do
      it 'raises an OAuth2 exception' do
        client = Facilethings::Client.new BAD_CREDENTIALS
        expect { client.user }.to raise_exception(OAuth2::Error)
      end
    end
    context 'when oauth authentication is all wrong' do
      it 'raises a bas URI exception' do
        client = Facilethings::Client.new FAKE_CREDENTIALS
        expect { client.user }.to raise_exception(URI::BadURIError)
      end
    end
  end

  describe ".user" do
	  it "should be me" do
      client = Facilethings::Client.new GOOD_CREDENTIALS
	  	client.user[:id] == 1
	  end

    it "should be me - stubbed" do
      client = double('client', :user => ME)
      client.user[:id] == ME[:id]
    end
	end

end
