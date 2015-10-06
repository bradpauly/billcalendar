require 'test_helper'

class BillTest < ActiveSupport::TestCase
  test "requires name and due_day" do
    assert_not Bill.new(name: 'Comcast').valid?
    assert_not Bill.new(due_day: '2').valid?
    assert Bill.new(name: 'Comcast', due_day: '5').valid?
  end
end
