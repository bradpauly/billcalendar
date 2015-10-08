require 'test_helper'

class TwitterAuthenticationTest < ActiveSupport::TestCase
  test "#user creates a User from info hash" do
    info = {'name' => 'Joe', 'nickname' => 'joejoe'}
    user = TwitterAuthentication.new.user(info)
    assert user.is_a?(User)
    assert_equal user.email, "@#{info['nickname']}"
    assert_equal user.name, info['name']
  end
end
