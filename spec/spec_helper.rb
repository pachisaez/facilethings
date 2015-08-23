require 'webmock/rspec'
require 'facilethings'

#MacbookPro
#FT_KEY = "79e93d1b2fd0e8b6678856a8bfee3303292e0e17c293bd2546fc769765fa5eac"
#FT_SECRET = "9165b3069a797b0f81ce7d3c9732558d9a9d9b46e1b2634ee8b0823868883e88"
#MY_ACCESS_TOKEN = "f83c6f850a655da4329f05c4d50bc5de8635495b63123240c56224e1856bcb6e"
#FT_ENDPOINT = "http://api.lvh.me:3003"

#iMac
FT_KEY = "8b18b0acd6c865598da42da5c81e5cd3e4b77f54d467719bae05ddfda60c984e"
FT_SECRET = "cde76257d552e464b0d96a30512353e215c7cd7b1043685f87d8570d6f448114"
MY_ACCESS_TOKEN = "09b1623682d35ddd225fb9088b28541007928c05a58f7ec11364877faea4780f"
FT_ENDPOINT = "http://api.lvh.me:3003"

WebMock.disable_net_connect!(:allow => "api.lvh.me")

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def a_get(path)
  a_request(:get, Facilethings::Client::URL_PREFIX + path)
end

def a_post(path)
  a_request(:post, Facilethings::Client::URL_PREFIX + path)
end

def a_put(path)
  a_request(:put, Facilethings::Client::URL_PREFIX + path)
end

def a_delete(path)
  a_request(:delete, Facilethings::Client::URL_PREFIX + path)
end

def stub_get(path)
  stub_request(:get, Facilethings::Client::URL_PREFIX + path).
  	with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>"Bearer #{MY_ACCESS_TOKEN}", 'User-Agent'=>'Faraday v0.9.0'})
end

def stub_post(path)
	stub_request(:post, Facilethings::Client::URL_PREFIX + path).
    with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>"Bearer #{MY_ACCESS_TOKEN}", 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'Faraday v0.9.0'})
end

def stub_put(path)
	stub_request(:put, Facilethings::Client::URL_PREFIX + path).
    with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>"Bearer #{MY_ACCESS_TOKEN}", 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'Faraday v0.9.0'})
end

def stub_delete(path)
	stub_request(:delete, Facilethings::Client::URL_PREFIX + path).
    with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>"Bearer #{MY_ACCESS_TOKEN}", 'User-Agent'=>'Faraday v0.9.0'})
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
