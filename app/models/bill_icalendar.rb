class BillIcalendar
  def initialize(bills, start_date, end_date = Date.today + 1.year)
    @start_date = start_date
    @end_date = end_date
    @bills = bills
    @icalendar = Icalendar::Calendar.new
  end

  def to_ical
    return if @start_date >= @end_date

    @icalendar.prodid = "-//BillCalendar//BILLS"
    calendar_date = @start_date
    while(calendar_date <= @end_date) do
      @bills.each do |bill|
        add_bill_event(@icalendar, bill, calendar_date)
      end
      calendar_date += 1.month
    end

    @icalendar.to_ical
  end

private
  def add_bill_event(calendar, bill, date)
    calendar.event do |e|
      date_string   = "#{date.year}#{date.month.to_s.rjust(2, '0')}#{bill.due_day.to_s.rjust(2, '0')}"
      e.dtstart     = Icalendar::Values::Date.new(date_string)
      e.dtend       = Icalendar::Values::Date.new(date_string)
      e.summary     = bill.summary
      e.description = bill.summary
      e.ip_class    = "PUBLIC"
    end
  end
end
