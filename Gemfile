source 'https://rubygems.org'

gem 'rails', '3.2.11'

gem 'pg'
gem 'json'
gem 'unicorn'
gem 'twitter-bootstrap-rails'

group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development do
  gem 'flog'
  gem 'thin'
  gem 'better_errors'
  gem 'binding_of_caller' # Adds some features to BetterErrors
end

group :test do
  gem 'spork'
  gem 'webmock'
  gem 'capybara-mechanize'
  gem 'machinist'
  gem 'simplecov', :require => false
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'timecop'
  gem 'poltergeist'
  gem 'email_spec'
  gem 'resque_spec'
end

group :development, :test do
  gem 'launchy'
  gem 'rspec-rails'
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-theme'
  gem 'debugger'
end