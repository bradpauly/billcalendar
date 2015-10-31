class EmailCredential < ActiveRecord::Base
  has_secure_password

  belongs_to :user

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: /@/
end
