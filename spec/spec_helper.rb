ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

require 'rspec/rails'

RSpec.configure do |c|
  c.use_transactional_fixtures = false
end
