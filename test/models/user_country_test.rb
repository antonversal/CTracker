require 'test_helper'

class UserCountryTest < ActiveSupport::TestCase
  setup do
    @user = users(:smith)
  end

  test "#batch_create" do
    country = countries(:ukraine)
    result = UserCountry.batch_create([country.id], @user)
    expected = [{country.id => {status: :created}}]
    assert_equal(expected,result)
  end

  test "#batch_create increase count" do
    country = countries(:ukraine)
    assert_difference(->{@user.user_countries.count}, 1) do
      UserCountry.batch_create([country.id], @user)
    end
  end

  test "#batch_create when country_id doesn't exists" do
    result = UserCountry.batch_create([123], @user)
    expected = [{123 => {status: :error,
                         errors: {country: ["can't be blank"]}}}]
    assert_equal(expected,result)
  end

  test "#batch_create when country_id is null" do
    result = UserCountry.batch_create([nil], @user)
    expected = [{nil => {status: :error,
                         errors: {country_id: ["can't be blank"],
                                  country: ["can't be blank"]}}}]
    assert_equal(expected,result)
  end

  test "#batch_destroy" do
    country = countries(:usa)
    result = @user.user_countries.batch_destroy([country.id])
    expected = [{country.id => {status: :destroyed}}]
    assert_equal(expected,result)
  end

  test "#batch_destroy decrease count" do
    country = countries(:usa)
    assert_difference(->{@user.user_countries.count}, -1) do
      @user.user_countries.batch_destroy([country.id])
    end
  end

end
