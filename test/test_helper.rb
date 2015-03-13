require "simplecov"
SimpleCov.start do
  add_filter "/factories/"
end

Dir[Rails.root.join("test/support/**/*.rb")].each { |f| require f }

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require "rails/test_help"
require "capybara/rails"
require "mocha/mini_test"
require "minitest/pride"
require "factory_girl_rails"
require "database_cleaner"
require "date"

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  DatabaseCleaner.strategy = :transaction

  def setup
    DatabaseCleaner.start
    FactoryGirl.reload
  end

  def teardown
    DatabaseCleaner.clean
  end
end

class ActionDispatch::IntegrationTest
  include FactoryGirl::Syntax::Methods
  include Capybara::DSL
  include TestHelperMethods

  def setup
    DatabaseCleaner.start
    FactoryGirl.reload
  end

  def teardown
    reset_session!
    DatabaseCleaner.clean
  end

end
