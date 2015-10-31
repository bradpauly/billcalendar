# Maps twitter auth hash to user attributes.
# https://github.com/arunagw/omniauth-twitter
# NOTE: Email is not provided by twitter so make one up, what could go wrong?
class TwitterAuthentication
  def user(info)
    User.create(name: info['name'])
  end
end
