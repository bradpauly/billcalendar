class ExternalAuthenticationsController < ApplicationController
  def create
    user = ExternalAuthentication.find_or_create_user(
      provider: auth_hash['provider'],
      uid: auth_hash['uid'],
      info: auth_hash['info']
    )
    start_session(user)
    redirect_to bills_url
  end

protected
  def auth_hash
    request.env['omniauth.auth']
  end
end
