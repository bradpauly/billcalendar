class BillsController < ApplicationController
  def index
    @bills = current_user.bills.order(due_day: 'ASC')
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = current_user.bills.build(bill_params)
    if @bill.save
      redirect_to bills_url
    else
      render :new
    end
  end

private
  def bill_params
    params.require(:bill).permit(:name, :due_day)
  end
end
