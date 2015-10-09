require 'test_helper'

class CalendarControllerTest < ActionController::TestCase
  test "renders icalendar" do
    jim = users(:jim)
    get :index, token: jim.calendar_token, format: :ics

    assert_response :success
    assert assigns(:calendar)
    assert assigns(:calendar).is_a?(BillIcalendar)
  end
end
