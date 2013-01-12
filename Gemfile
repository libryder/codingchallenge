source 'https://rubygems.org'

gem 'rails', '3.2.11'

gem 'sqlite3'
gem 'json'
gem 'unicorn'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development do
  gem 'flog'
  gem 'thin'
  gem 'rack-mini-profiler'
  gem 'better_errors'
  gem 'binding_of_caller' # Adds some features to BetterErrors
end

group :test do
  gem 'spork'
  gem 'webmock'
  gem 'vcr'
  gem 'capybara-mechanize'
  gem 'machinist'
  gem 'simplecov', :require => false
  gem 'fakeredis'
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