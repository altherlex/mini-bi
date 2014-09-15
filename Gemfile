source "https://rubygems.org"

# Declare your gem's dependencies in mini-bi.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# jquery-rails is used by the dummy application
gem "jquery-rails"

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'debugger'
#group :assets do
  gem "therubyracer"
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  #gem "haml"
  gem 'sass-rails'
  gem 'coffee-rails'
#end
#gem 'formtastic'
#gem 'formtastic-bootstrap'
gem 'simple_form'
gem 'rails'

group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'ibm_db', '2.5.11'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end

gem "best_in_place", :git=>'https://github.com/bernat/best_in_place.git'
gem 'twitter-bootstrap-rails', :path=>'../twitter-bootstrap-rails' 
gem 'bootstrap-rails-engine'
#gem 'twitter-bootstrap-rails', :branch => 'master', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
#gem "select2-rails", :branch=> 'master'
#gem 'csv'
gem 'whenever', :require => false
gem 'pdfkit' #export html2pdf
gem 'wkhtmltopdf-binary'
gem 'delayed_job' #asynchronous priority queue system
