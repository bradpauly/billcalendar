Rails.application.config.middleware.use OmniAuth::Builder do
  twitter_config = Rails.application.config_for(:twitter)
  provider :twitter, twitter_config['api_key'], twitter_config['api_secret']
end
