require 'test_helper'

class UserCountriesControllerTest < ActionController::TestCase
  setup do
    @user_country = user_countries(:smith_usa)
  end

  test "should create user_country" do
    assert_difference('UserCountry.count') do
      post :create, user_country: { country_id: @user_country.country_id, user_id: @user_country.user_id }
    end

    assert_redirected_to user_country_path(assigns(:user_country))
  end

  test "should destroy user_country" do
    assert_difference('UserCountry.count', -1) do
      delete :destroy, id: @user_country
    end

    assert_redirected_to user_countries_path
  end
end
