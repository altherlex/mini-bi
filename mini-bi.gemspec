$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mini-bi/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mini-bi"
  s.version     = MiniBi::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of MiniBi."
  s.description = "TODO: Description of MiniBi."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  #s.test_files = Dir["test/**/*"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.17"
  s.add_dependency "jquery-rails"
  #s.add_dependency "twitter-bootstrap-rails"
  s.add_dependency "twitter-bootstrap-rails"
  s.add_development_dependency 'rspec-rails'
  #s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'shoulda'

  s.add_dependency "ibm_db", '2.5.11'
end
