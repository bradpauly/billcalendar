class BillsController < ApplicationController
  def index
    @today = Date.today
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

  def edit
    @bill = current_user.bills.find(params[:id])
  end

  def update
    @bill = current_user.bills.find(params[:id])
    if @bill.update_attributes(bill_params)
      redirect_to bills_url
    else
      render :edit
    end
  end

  def destroy
    @bill = current_user.bills.find(params[:id])
    @bill.destroy
    redirect_to bills_url
  end

private
  def bill_params
    params.require(:bill).permit(:name, :due_day)
  end
end
