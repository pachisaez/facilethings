require 'spec_helper'

describe "configuration" do
  it 'should have a version' do
    expect(Facilethings::VERSION).to be_a String
  end
end
