# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

gem "rails", "~> 6.1"

gem "bootsnap", ">= 1.4.2", require: false
gem "puma", "~> 4.1"
gem "ropenweather", git: "https://github.com/souzagab/ropenweather.git"
gem "twitter", "~> 7.0.0"

group :test do
  gem "rspec-rails", "~> 4.0.1"
  gem "shoulda-matchers", "~> 4.0"

  gem "vcr", "~> 6.0"
  gem "webmock", "~> 3.9", ">= 3.9.3"
end

group :development do
  gem "listen", "~> 3.2"
  gem "rubocop-performance"
  gem "rubocop-rails"

  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "dotenv-rails"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
