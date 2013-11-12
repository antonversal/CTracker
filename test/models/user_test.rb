require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    @user = users(:doe)
  end

  test "#visited_countries_count" do
    assert_equal(1, @user.visited_countries_count)
  end

  test "#not_visited_countries_count" do
    assert_equal(1, @user.not_visited_countries_count)
  end
end
