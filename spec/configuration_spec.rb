require 'spec_helper'

describe "configuration" do
  it 'should have a version' do
    Facilethings::VERSION.should_not be_nil
  end

  Facilethings::Configuration::VALID_OPTIONS_KEYS.each do |key|
    describe ".#{key}" do
      it 'should return the default value' do
        Facilethings.send(key).should == Facilethings::Configuration.const_get("DEFAULT_#{key.upcase}")
      end
    end
  end
 
  describe "configure" do
  	after(:each) { Facilethings.reset }
  	Facilethings::Configuration::VALID_CONFIG_KEYS.each do |key|
		  it "should set the #{key}" do
	      Facilethings.configure do |config|
	        config.send("#{key}=", key)
	        Facilethings.send("#{key}").should == key
	      end
	    end
	  end
  end
end
