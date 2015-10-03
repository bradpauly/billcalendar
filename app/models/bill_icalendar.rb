class BillIcalendar
  def initialize(user, bills)
    @user  = user
    @bills = bills
  end

  def to_ical
    @icalendar = Icalendar::Calendar.new
    today = Date.today
    (0..2).each do |n|
      date = today + n.months
      @bills.each do |bill|
        @icalendar.event do |e|
          date_string = "#{date.year}#{date.month.to_s.rjust(2, '0')}#{bill.due_day.to_s.rjust(2, '0')}"
          e.dtstart   = Icalendar::Values::Date.new(date_string)
          # e.dtend   = Icalendar::Values::Date.new("20050429")
          e.summary   = "#{bill.name} is due"
          e.ip_class  = "PRIVATE"
        end
      end
    end
    @icalendar.to_ical
  end
end
