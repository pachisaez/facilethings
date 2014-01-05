require 'facilethings'

FT_KEY = "W2hT29H9OE2OjmFFwpAwvnDJGkukRWK2Rqm03CoL"
FT_SECRET = "h1utdPZWOXlpSvxcWObYhvQNXivudrZXxWAL0xhi"
FT_ENDPOINT = "http://api.lvh.me:3003"
MY_ACCESS_TOKEN = "HYzbXFZ0tZWLLoXsPyM2u8FmBfZjwcjH5EpWm1Uh"

GOOD_CREDENTIALS = {
	:key => FT_KEY, :secret => FT_SECRET, :endpoint => FT_ENDPOINT, :token =>  MY_ACCESS_TOKEN
}

BAD_CREDENTIALS = {
	:key => FT_KEY, :secret => FT_SECRET, :endpoint => FT_ENDPOINT, :token =>  'bad_token'
}

FAKE_CREDENTIALS = {
	:key => 'key', :secret => 'secret', :endpoint => 'endpoint', :token =>  'token'	
}

ME = {
	:id => 1, :language => "en", :time_zone => "Madrid"
}
