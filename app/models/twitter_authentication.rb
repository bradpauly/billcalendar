# Maps twitter auth hash to user attributes.
# https://github.com/arunagw/omniauth-twitter
# NOTE: Email is not provided by twitter so make one up, what could go wrong?
class TwitterAuthentication
  def user(info)
    email = "@#{info['nickname']}"
    User.find_or_create_by(email: email) do |user|
      user.name = info['name']
    end
  end
end
