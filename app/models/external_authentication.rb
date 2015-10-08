class ExternalAuthentication < ActiveRecord::Base
  belongs_to :user

  validates :uid, presence: true
  validates :provider, presence: true

  def self.find_or_create_user(provider: nil, uid: nil, info: {})
    return false unless provider

    if external_authentication = self.find_by(uid: uid, provider: provider)
      external_authentication.user
    else
      new_user = nil
      ActiveRecord::Base.transaction do
        external_authentication = self.create(uid: uid, provider: provider)
        new_user = provider_authentication(provider).user(info)
        external_authentication.update_attribute(:user_id, new_user.id)
      end
      new_user
    end
  end

private
  def self.provider_authentication(provider)
    "#{provider.camelize}Authentication".constantize.new
  end
end
