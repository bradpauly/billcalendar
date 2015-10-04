class RegistrationForm < ActiveForm::Form
  accepts_attributes_for :user, :name, :email
  accepts_attributes_for :passphrase, :password

  within_save :associate_passphrase
  after_save :send_welcome_email

  def associate_passphrase
    passphrase.update_attribute(:user_id, user.id)
  end

  def send_welcome_email
    # UserMailer.welcome(user).deliver
  end
end
