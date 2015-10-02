class RegistrationForm < ActiveForm::Form
  accepts_attributes_for :user, :name, :email, :password

  after_save :send_welcome_email

  def send_welcome_email
    # UserMailer.welcome(user).deliver
  end
end
