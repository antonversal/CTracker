ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'support/controller_matchers'
require 'support/model_matchers'

class ActiveSupport::TestCase
  extend ControllerMatchers
  extend ModelMatchers
  ActiveRecord::Migration.check_pending!
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  def testing_class
    begin
      self.class.to_s[0..-5].constantize
    rescue NameError
      nil
    end
  end
end
