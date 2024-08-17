# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.2.2"

gem "rails", "~> 7.1.3", ">= 7.1.3.2"

gem "bootsnap", require: false
gem "cssbundling-rails"
gem "inline_svg"
gem "jbuilder"
gem "jsbundling-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "rails_best_practices"
gem "redis", ">= 4.0.1"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[windows jruby]
gem "vite_rails"

group :development, :test do
  gem "bullet"
  gem "debug", platforms: %i[mri windows]
  gem "dotenv"
  gem "pry"
  gem "rspec-rails", "~> 6.1.0"
end

group :development do
  gem "brakeman", require: false
  gem "erb_lint", require: false
  gem "factory_bot_rails", require: false
  gem "rubocop", require: false
  gem "rubocop-capybara", require: false
  gem "rubocop-factory_bot", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
  gem "rubocop-rspec_rails", require: false
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "database_cleaner-active_record"
  gem "rails-controller-testing"
  gem "selenium-webdriver"
  gem "shoulda-matchers", "~> 6.0"
  gem "simplecov", require: false
end
