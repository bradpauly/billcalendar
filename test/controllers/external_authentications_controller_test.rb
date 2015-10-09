require 'test_helper'

class ExternalAuthenticationsControllerTest < ActionController::TestCase
  test "works with twitter hash and unknown user" do
    @request.env['omniauth.auth'] = {'provider' => 'twitter', 'uid' => '999', 'info' => {'nickname' => 'hello', 'name' => 'Hi.'}}
    get :create, provider: 'twitter'

    assert_redirected_to new_bill_url
  end

  test "works with twitter hash and existing auth" do
    auth_hash = external_authentications(:twitter)
    @request.env['omniauth.auth'] = {'provider' => 'twitter', 'uid' => auth_hash.uid, 'info' => {'nickname' => 'hello', 'name' => 'Hi.'}}
    get :create, provider: 'twitter'

    assert_redirected_to new_bill_url
  end

  test "works with google hash" do
    @request.env['omniauth.auth'] = {'provider' => 'google', 'uid' => '999', 'info' => {'email' => 'hi@example.com', 'name' => 'Hi.'}}
    get :create, provider: 'google'

    assert_redirected_to new_bill_url
  end

  test "failure scenario" do
    skip
  end
end
