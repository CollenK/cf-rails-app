source 'https://rubygems.org'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0.1'
# Use sqlite3 as the database for Active Record
gem 'devise'
gem 'cancancan', '~> 1.10'
gem 'will_paginate', '~> 3.1.0'
gem 'rails-controller-testing'
gem 'stripe'
# Gem file Security scaner for Ruby on Rails
gem "brakeman", :require => false
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Gem file for accesing memcashed servers
gem "dalli"
# Use connection pooling for Puma's multi-threaded runtime
gem 'connection_pool'
# Add Redis
gem 'redis-rails'
# Use New Relic for monitoring
gem 'newrelic_rpm'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Puma as the app server
gem 'puma', '~> 3.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'sqlite3'
  gem 'rspec-rails', '~>3.5'
  gem 'factory_girl_rails', '~> 4.0'
end

group :test do
  gem 'faker', '~> 1.6', '>= 1.6.6'
  gem 'capybara', '~> 2.8', '>= 2.8.1'
  gem 'database_cleaner', '~> 1.5', '>= 1.5.3'
  gem 'launchy', '~> 2.4', '>= 2.4.3'
  gem 'selenium-webdriver', '~> 2.53', '>= 2.53.4'
  gem 'fake_stripe'
  gem 'sinatra', '2.0.0.beta2' # Sinatra 2.0 required for Rails 5
  # gem 'stripe-ruby-mock', '~> 2.3.1', :require => 'stripe_mock'
  # gem 'thin'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg'
end
