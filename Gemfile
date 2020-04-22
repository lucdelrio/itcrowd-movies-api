source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'activeadmin', '2.4'
gem 'active_model_serializers', '~> 0.10.0'
gem 'devise_token_auth'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'database_cleaner'
  gem 'factory_bot_rails', '5.0.2'
  gem 'faker', '1.9.3'
  gem 'rspec', '~> 3.8'
  gem 'rubocop', '~> 0.66.0'
  gem 'simplecov', '~> 0.18.0', require: false
  gem 'rspec-json_expectations', '~> 2.2.0'
  gem 'rspec-rails', '~> 3.8.2'
  gem 'shoulda-matchers', '4.0.1'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
