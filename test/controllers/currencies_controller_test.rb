require 'test_helper'

class CurrenciesControllerTest < ActionController::TestCase
  should_not_respond_to_actions :new => :get, 
                                :destroy => :delete,
                                :create => :post,
                                :edit => :get, 
                                :update => :put,
                                :update => :patch,
                                :show => :get

  setup do
    @currency = currencies(:dollar)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:currencies)
  end
end