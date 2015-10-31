class PassphrasesChangeToEmailCredentials < ActiveRecord::Migration
  def change
    rename_table :passphrases, :email_credentials
    add_column :email_credentials, :email, :string, null: true

    User.all.each do |user|
      user.email_credentials.each do |email_credential|
        email_credential.update_attribute(:email, user.email)
      end
    end
  end
end
