require 'test_helper'

class CouponsControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should get generate_code" do
    get :generate_code
    assert_response :success
  end

end
