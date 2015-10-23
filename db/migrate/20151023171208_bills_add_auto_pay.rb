class BillsAddAutoPay < ActiveRecord::Migration
  def change
    add_column :bills, :auto_pay, :boolean, default: false
  end
end
