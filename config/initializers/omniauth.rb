Rails.application.config.middleware.use OmniAuth::Builder do
  twitter_config = Rails.application.config_for(:twitter)
  provider :twitter, twitter_config['api_key'], twitter_config['api_secret']

  google_config = Rails.application.config_for(:google)
  provider :google_oauth2, google_config['client_id'], google_config['client_secret'], {
    name: 'google',
    scope: 'email, profile'
  }
end
