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

  test "get country progress" do
    get :countries
    expected = [["2012-01-01", 1], ["2012-03-01", 1]]
    assert_equal(expected.to_json, response.body)
  end

  test "get currencies progress" do
    get :currencies
    expected = [["2012-01-01", 1], ["2012-03-01", 1]]
    assert_equal(expected.to_json, response.body)
  end
end
