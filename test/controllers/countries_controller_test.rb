require 'test_helper'

class CountriesControllerTest < ActionController::TestCase
  should_not_respond_to_actions :new => :get,
                                :destroy => :delete,
                                :create => :post,
                                :edit => :get,
                                :update => :put,
                                :update => :patch,
                                :show => :get

  setup do
    @country = countries(:ukraine)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:countries)
  end
end