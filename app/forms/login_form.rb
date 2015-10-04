class LoginForm < ActiveForm::Form
  attr_accessor :email, :password

  def authenticate
    if user = User.find_by_email(email)
      if user.passphrases.last.try(:authenticate, password)
        return user
      else
        false
      end
    else
      false
    end
  end
end
