# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails', '~> 6.0.3'
gem 'puma', '~> 4.1'
gem 'bootsnap', '>= 1.4.2', require: false

gem 'dotenv-rails'

gem 'ropenweather', git: 'https://github.com/souzagab/ropenweather.git'
gem 'twitter', '~> 7.0.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group  :test do
  gem 'rspec-rails', '~> 4.0.1'
  gem 'shoulda-matchers', '~> 4.0'
  gem 'vcr', '~> 6.0'
  gem 'webmock', '~> 3.9', '>= 3.9.3'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
