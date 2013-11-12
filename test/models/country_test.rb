require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  test_validates_presence_of :name, :code

  setup do
    @country = countries(:ukraine)
  end

  test "country is visited by user" do
    user = users(:doe)
    assert(@country.is_visited_by?(user))
  end

  test "country is not visited by user" do
    user = users(:smith)
    refute(@country.is_visited_by?(user))
  end
end