require 'test_helper'

class UserCountriesControllerTest < ActionController::TestCase
  setup do
    @user_country = user_countries(:smith_usa)
  end

  test "should batch create user_countries" do
    country = countries(:ukraine)
    assert_difference('UserCountry.count') do
      post :batch_create, country_ids: [country.id]
    end
    expected = [{country.id => {status: :created}}].to_json
    assert_response :ok
    assert_equal(expected, response.body)
  end

  test "should destroy batch user_countries" do
    assert_difference('UserCountry.count', -1) do
      delete :batch_destroy, country_ids: [@user_country.country_id]
    end
    expected = [{@user_country.country_id => {status: :destroyed}}].to_json
    assert_response :ok
    assert_equal(expected, response.body)
  end
end
