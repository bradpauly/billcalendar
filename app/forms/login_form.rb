class LoginForm < ActiveForm::Form
  attr_accessor :email, :password

  def authenticate
    EmailCredential.find_by(email: email).try(:authenticate, password).try(:user)
  end
end
