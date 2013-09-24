require 'coveralls'
Coveralls.wear!

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start do
  add_filter '/spec/'
end

# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"
ENV["APP_THEME"] = 'test'

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
#require "rails/test_help"
require "rspec/rails"
require 'generator_spec'
require 'rspec/expectations'
require 'themes'

#Rails.backtrace_cleaner.remove_silencers!

#migrate_path = File.expand_path("../dummy/db/migrate", __FILE__)
#seeds_path = File.expand_path("../dummy/db/seeds.rb", __FILE__)
#
#ActiveRecord::Migrator.migrate(migrate_path)
#if File.exists?(seeds_path)
#  load seeds_path
#end

RSpec.configure do |config|
  # Remove this line if you don't want RSpec's should and should_not
  # methods or matchers

  #config.use_transactional_fixtures = false

  config.include RSpec::Matchers
  config.include RSpec::Rails::ControllerExampleGroup, type: :controller

  config.include GeneratorSpec::GeneratorExampleGroup, type: :generator, example_group: {
    file_path: config.escaped_path(%w[spec generators])
  }


  # == Mock Framework
  config.mock_with :rspec
end