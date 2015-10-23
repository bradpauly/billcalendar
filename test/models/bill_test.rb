require 'test_helper'

class BillTest < ActiveSupport::TestCase
  test "requires name and due_day" do
    assert_not Bill.new(name: 'Comcast').valid?
    assert_not Bill.new(due_day: '2').valid?
    assert Bill.new(name: 'Comcast', due_day: '5').valid?
  end

  test "defaults auto_pay to false" do
    assert_not Bill.new.auto_pay?
  end

  test "summary reflects auto_pay off" do
    bill = Bill.new(name: 'Comcast')
    assert_equal "Comcast is due", bill.summary
  end

  test "summary reflects auto_pay on" do
    bill = Bill.new(name: 'Comcast', auto_pay: true)
    assert_equal "Comcast is auto paid", bill.summary
  end
end
