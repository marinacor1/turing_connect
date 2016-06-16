Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV["HEROK_GITHUB_KEY"], ENV["HEROKU_GITHUB_SECRET"]
end
