$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "facilethings/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "facilethings"
  s.version     = Facilethings::VERSION
  s.authors     = ["Francisco Sáez"]
  s.email       = ["francisco.saez@facilethings.com"]
  s.homepage    = "http://facilethings.com"
  s.summary     = "FacileThings API Wrap"
  s.description = "FacileThings API Wrap"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "oauth2", '~> 0.9.2'
  s.add_dependency 'json', '~> 1.8'

  s.add_dependency 'memoizable', '~> 0.4.0'
  s.add_dependency 'addressable', '~> 2.3'
  s.add_dependency 'webmock'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec'
end
