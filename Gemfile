source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "~> 3.2.2"
gem 'sassc-rails'
gem 'rails', '~> 7.0.8'
gem 'pg', '>= 1.5'
gem 'puma', '~> 6.0'
gem 'bcrypt', '~> 3.1.7'
gem 'dotenv-rails'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'image_processing', '~> 1.2'

group :development, :test do
  gem 'byebug'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry-rails'
  gem 'listen', '~> 3.8'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'faker', '~> 3.3'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
