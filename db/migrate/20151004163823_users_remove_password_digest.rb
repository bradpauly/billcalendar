class UsersRemovePasswordDigest < ActiveRecord::Migration
  def up
    User.all.each do |user|
      user.passphrases.create(password_digest: user.password_digest)
    end

    remove_column :users, :password_digest
  end
end
