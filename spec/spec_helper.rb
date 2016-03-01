ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../spec/dummy/config/environment', __FILE__)

require 'capybara/rspec'
require 'database_cleaner'
require 'espinita'
require 'rspec/autorun'
require 'rspec/rails'
require 'support/models'
require 'support/schema'

RSpec.configure do |config|
  config.infer_base_class_for_anonymous_controllers = false

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :truncation
  end
end
