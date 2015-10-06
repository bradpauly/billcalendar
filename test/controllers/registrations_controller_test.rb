require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  test "displays registration form" do
    get :new
    assert_response :success
    assert_not_nil assigns(:registration_form)
  end

  test "failed registration renders form" do
    post :create, registration_form: {user_name: '', user_email: 'ted@example.com', passphrase_password: 'testing'}
    assert_response :success
    assert_not_nil assigns(:registration_form)
  end

  test "successful registration redirects to new bill" do
    post :create, registration_form: {user_name: 'Ted', user_email: 'ted@example.com', passphrase_password: 'testing'}
    assert_not_nil assigns(:registration_form)
    assert_redirected_to new_bill_url
  end
end
