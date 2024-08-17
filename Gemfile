# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.2.2"

gem "rails", "~> 7.1.3", ">= 7.1.3.2"

gem "sprockets-rails"

gem "pg", "~> 1.1"

gem "puma", ">= 5.0"

gem "jsbundling-rails"

gem "turbo-rails"

gem "stimulus-rails"

gem "cssbundling-rails"

gem "jbuilder"

gem "redis", ">= 4.0.1"

gem "tzinfo-data", platforms: %i[windows jruby]

gem "bootsnap", require: false

gem "vite_rails"

group :development, :test do
  gem "debug", platforms: %i[mri windows]
end

group :development do
  gem "rubocop", require: false
  gem "rubocop-capybara", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
