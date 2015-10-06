class TwitterAuthentication
  def user(info)
    User.create(name: info['name'], email: info['nickname'])
  end
end
