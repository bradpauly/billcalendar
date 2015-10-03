class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: /@/

  has_many :bills

  before_create :generate_calendar_token

  def refresh_calendar_token
    generate_calendar_token
    save
  end

private
  def generate_calendar_token
    if (tmp = ::SecureRandom.hex) && self.class.find_by_calendar_token(tmp).nil?
      self.calendar_token = tmp
    else
      generate_calendar_token
    end
  end
end
