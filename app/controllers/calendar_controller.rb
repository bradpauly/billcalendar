class CalendarController < ApplicationController
  def index
    user = User.find_by_calendar_token(params[:token])
    @calendar = BillIcalendar.new(user.bills, user.created_at)

    respond_to do |format|
      format.ics { render mime_type: Mime::ICS }
      format.text { render text: @calendar.to_ical, layout: false }
    end
  end
end
