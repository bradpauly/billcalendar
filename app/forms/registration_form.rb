class RegistrationForm < ActiveForm::Form
  accepts_attributes_for :user, :name, :email
  accepts_attributes_for :passphrase, :password

  within_save :associate_passphrase

  def associate_passphrase
    passphrase.update_attribute(:user_id, user.id)
  end
end
