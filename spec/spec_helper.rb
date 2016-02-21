require 'webmock/rspec'
require 'facilethings'

#MacbookPro
#FT_KEY = "79e93d1b2fd0e8b6678856a8bfee3303292e0e17c293bd2546fc769765fa5eac"
#FT_SECRET = "9165b3069a797b0f81ce7d3c9732558d9a9d9b46e1b2634ee8b0823868883e88"
#MY_ACCESS_TOKEN = "f83c6f850a655da4329f05c4d50bc5de8635495b63123240c56224e1856bcb6e"
#FT_ENDPOINT = "http://api.lvh.me:3003"

#iMac
FT_KEY = "5229b0e5fbe7013b7cb4cd16f68e5abe8aa8f119041139737dff0f98dcf567f0"
FT_SECRET = "e141239b48bddb60b6fa80b6733014016cc97d34204a250d230b18f0962b287f"
MY_ACCESS_TOKEN = "e88648aa53389914cbc71b7dbcb791f466bb830088a5384395727c32d7bfa76a"
FT_ENDPOINT = "http://api.lvh.me:3003"
USER_AGENT = "Faraday v0.9.2"

WebMock.disable_net_connect!
#WebMock.disable_net_connect!(:allow => "api.lvh.me")

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def a_get(path)
  a_request(:get, FT_ENDPOINT + path)
end

def a_post(path)
  a_request(:post, FT_ENDPOINT + path)
end

def a_put(path)
  a_request(:put, FT_ENDPOINT + path)
end

def a_delete(path)
  a_request(:delete, FT_ENDPOINT + path)
end

def stub_get(path)
  stub_request(:get, FT_ENDPOINT + path).
  	with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>"Bearer #{MY_ACCESS_TOKEN}", 'User-Agent'=>"#{USER_AGENT}"})
end

def stub_post(path)
	stub_request(:post, FT_ENDPOINT + path).
    with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>"Bearer #{MY_ACCESS_TOKEN}", 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>"#{USER_AGENT}"})
end

def stub_put(path, content=true)
  if content
    headers = {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>"Bearer #{MY_ACCESS_TOKEN}", 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>"#{USER_AGENT}"} 
  else
    headers = {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>"Bearer #{MY_ACCESS_TOKEN}", 'Content-Length'=>'0', 'User-Agent'=>"#{USER_AGENT}"}
  end
	stub_request(:put, FT_ENDPOINT + path).with(:headers => headers)
end

def stub_delete(path)
	stub_request(:delete, FT_ENDPOINT + path).
    with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>"Bearer #{MY_ACCESS_TOKEN}", 'User-Agent'=>"#{USER_AGENT}"})
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
