require 'test_helper'

class BillIcalendarTest < ActiveSupport::TestCase
  def setup
    @jim = users(:jim)
    @bills = @jim.bills
  end

  test "to_ical return icalendar format text" do
    calendar = BillIcalendar.new(@jim, [])
    assert_match /BEGIN:VCALENDAR/, calendar.to_ical
    assert_match /END:VCALENDAR/, calendar.to_ical
  end

  test "to_ical adds bills as events in icalendar format" do
    calendar = BillIcalendar.new(@jim, @bills)
    bill = @bills.last
    assert_match /BEGIN:VEVENT/, calendar.to_ical
    assert_match /SUMMARY:#{bill.name}/, calendar.to_ical
  end
end
