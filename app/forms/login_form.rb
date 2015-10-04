class LoginForm < ActiveForm::Form
  attr_accessor :email, :password

  def authenticate
    if user = User.find_by_email(email)
      user.authenticate(password)
    else
      false
    end
  end
end
