class RegistrationForm < ActiveForm::Form
  accepts_attributes_for :user, :name
  accepts_attributes_for :email_credential, :email, :password

  within_save :associate_credentials

  def associate_credentials
    email_credential.update_attribute(:user_id, user.id)
    user.update_attribute(:email, email_credential.email)
  end
end
