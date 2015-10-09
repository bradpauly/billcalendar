require 'test_helper'

class BillsControllerTest < ActionController::TestCase
  def setup
    @jim = users(:jim)
  end

  test "requires login" do
    get :index
    assert_redirected_to login_url
  end

  test "index lists user's bills" do
    login_as(@jim)
    get :index

    assert_response :success
    assert_template :index
    assert assigns(:bills)
    assert assigns(:today)
  end

  test "new renders form" do
    login_as(@jim)
    get :new

    assert_response :success
    assert_template :new
  end

  test "create redirects on succss" do
    login_as(@jim)
    post :create, bill: {name: 'The End', due_day: 12}

    assert_redirected_to bills_url
  end

  test "create renders new form on failure" do
    login_as(@jim)
    post :create, bill: {name: 'The End'}

    assert_response :success
    assert_template :new
  end

  test "edit renders form" do
    bill = @jim.bills.first
    login_as(@jim)
    get :edit, id: bill.id

    assert_response :success
    assert_template :edit
    assert_equal assigns(:bill), bill
  end

  test "update renders from on failure" do
    bill = @jim.bills.first
    login_as(@jim)
    put :update, id: bill.id, bill: {name: ''}

    assert_response :success
    assert_template :edit
    assert_equal assigns(:bill), bill
  end

  test "update redirects on success" do
    bill = @jim.bills.first
    login_as(@jim)
    put :update, id: bill.id, bill: {name: 'USBank CC', due_day: 1}

    assert_redirected_to bills_url
  end

  test "destroy redirects" do
    bill = @jim.bills.first
    login_as(@jim)
    post :destroy, id: bill.id

    assert assigns(:bill)
    assert_redirected_to bills_url
  end
end
