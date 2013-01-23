source 'https://rubygems.org'

gem 'rails', '3.2.11'

gem 'pg'
gem 'json'
gem 'unicorn'
gem 'twitter-bootstrap-rails'
gem 'thin'
gem 'devise'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-github'
gem 'cancan'
gem 'nested_form'
gem 'acts_as_votable'
gem 'activeadmin'
gem 'inherited_resources'
gem 'hashie'

configure :production do
  require 'newrelic_rpm'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.5'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development do
  gem 'flog'
  gem 'better_errors'
  gem 'binding_of_caller' # Adds some features to BetterErrors
end

group :test do
  gem 'poltergeist'
  gem 'rack-contrib'
  gem 'spork'
  gem 'capybara'
  gem 'capybara-mechanize'
  gem 'machinist'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'timecop'
  gem 'email_spec'
  gem 'resque_spec'
end

group :development, :test do
  gem 'sqlite3'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-theme'
  gem 'debugger'
end