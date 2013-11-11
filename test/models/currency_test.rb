require 'test_helper'

class CurrencyTest < ActiveSupport::TestCase
  test_validates_presence_of :name, :code, :country_id
end
