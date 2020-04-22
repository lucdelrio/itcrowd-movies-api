# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
require 'rspec/rails'
require 'simplecov'

RSpec.configure do |config|
  config.include ActionDispatch::TestProcess
  config.infer_spec_type_from_file_location!
  config.include(FactoryBot::Syntax::Methods)
  config.order = 'random'
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :active_record
    with.library :active_model
    with.library :rails
  end
end
