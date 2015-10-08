# Maps Google Oauth2 auth hash to user.
# https://github.com/zquestz/omniauth-google-oauth2
class GoogleAuthentication
  def user(info)
    User.find_or_create_by(email: info['email']) do |user|
      user.name = info['name']
    end
  end
end
