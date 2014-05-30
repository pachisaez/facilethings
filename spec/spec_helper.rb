require 'webmock/rspec'
require 'facilethings'

FT_KEY = "W2hT29H9OE2OjmFFwpAwvnDJGkukRWK2Rqm03CoL"
FT_SECRET = "h1utdPZWOXlpSvxcWObYhvQNXivudrZXxWAL0xhi"
FT_ENDPOINT = "http://api.lvh.me:3003"
MY_ACCESS_TOKEN = "HYzbXFZ0tZWLLoXsPyM2u8FmBfZjwcjH5EpWm1Uh"

WebMock.disable_net_connect!(:allow => "api.lvh.me")

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def a_get(path)
  a_request(:get, Facilethings::Client::URL_PREFIX + path)
end

def stub_get(path)
  stub_request(:get, Facilethings::Client::URL_PREFIX + path).
  	with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>"Bearer #{MY_ACCESS_TOKEN}", 'User-Agent'=>'Faraday v0.9.0'})
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
