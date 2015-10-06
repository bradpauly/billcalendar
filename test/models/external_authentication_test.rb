require 'test_helper'
class ExternalAuthenticationTest < ActiveSupport::TestCase
  test "requires provider and uid" do
    assert_not ExternalAuthentication.new(provider: 'twitter').valid?
    assert_not ExternalAuthentication.new(uid: 'uid').valid?
    assert ExternalAuthentication.new(provider: 'twitter', uid: 'uid').valid?
  end

  test "find_or_create_user finds a user" do
    jim = users(:jim)
    twitter = external_authentications(:twitter)
    user = ExternalAuthentication.find_or_create_user(provider: twitter['provider'], uid: twitter['uid'])
    assert_equal jim, user
  end

  test "find_or_create_user creates a new User" do
    user = ExternalAuthentication.find_or_create_user(provider: 'twitter', uid: 'abc')
    assert user.is_a?(User)
  end

  test "find_or_create_user returns false without provider" do
    assert_not ExternalAuthentication.find_or_create_user
  end
end
