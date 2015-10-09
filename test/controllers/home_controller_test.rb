require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "no errors!" do
    get :index

    assert_response :success
    assert_template :index
    assert assigns(:login_form)
    assert assigns(:registration_form)
  end
end
