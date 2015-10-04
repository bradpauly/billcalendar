require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "New user has 32 char calendar token" do
    user = User.create(name: 'Jill', email: 'jill@example.com')
    assert user.calendar_token
    assert_equal 32, user.calendar_token.length
  end

  test "refresh_calendar_token changes the calendar token" do
    user = User.create(name: 'Jill', email: 'jill@example.com')
    old_token = user.calendar_token
    user.refresh_calendar_token
    assert_not_equal old_token, user.calendar_token
  end
end
