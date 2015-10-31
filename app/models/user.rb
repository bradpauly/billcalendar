class User < ActiveRecord::Base
  validates :name, presence: true

  has_many :external_authentications
  has_many :email_credentials
  has_many :bills

  before_create :generate_calendar_token

  def refresh_calendar_token
    generate_calendar_token
    save
  end

private
  def generate_calendar_token
    if (tmp = ::SecureRandom.hex) && self.class.find_by(calendar_token: tmp).nil?
      self.calendar_token = tmp
    else
      generate_calendar_token
    end
  end
end
