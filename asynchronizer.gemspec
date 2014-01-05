$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "asynchronizer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "asynchronizer"
  s.version     = Asynchronizer::VERSION
  s.authors     = ["Kevin Goslar"]
  s.email       = ["kevin.Goslar@gmail.com"]
  s.homepage    = "https://github.com/kevgo/asynchronizer.js"
  s.summary     = "Tools for collecting data through multiple asynchronous events in JavaScript."
  s.description = "Provides tools to gathering events and data from asynchronous event sources."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails', '> 3.2.0'
  s.add_dependency 'coffee-rails'

  s.add_development_dependency 'guard-livereload'
  # Note (KG): Having konacha here
  # makes "bundle install --dependencies" detonate.
  # s.add_development_dependency 'konacha'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'uglifier'
  s.add_development_dependency 'poltergeist'
end
