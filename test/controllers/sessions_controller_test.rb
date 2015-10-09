require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "new renders login form" do
    get :new

    assert_response :success
    assert_template :new
    assert assigns(:login_form)
  end

  test "create renders login form on failure" do
    post :create

    assert_response :success
    assert_template :new
  end

  test "create renders login form with wrong password" do
    jim = users(:jim)
    post :create, login_form: {email: jim.email, password: 'nope'}

    assert_response :success
    assert_template :new
  end

  test "create renders login form with wrong email" do
    jim = users(:jim)
    post :create, login_form: {email: 'notjim@example.com', password: 'testing'}

    assert_response :success
    assert_template :new
  end


  test "create redirects to bills on success" do
    jim = users(:jim)
    post :create, login_form: {email: jim.email, password: 'testing'}

    assert_redirected_to bills_url
  end
end
