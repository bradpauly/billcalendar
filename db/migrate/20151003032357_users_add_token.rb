class UsersAddToken < ActiveRecord::Migration
  def change
    add_column :users, :calendar_token, :string, default: nil
  end
end
