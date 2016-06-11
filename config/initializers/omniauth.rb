Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV["HEROKU_GITHUB_KEY"], ENV["HEROKU_GITHUB_SECRET"],
  scope: 'read:org,repo'
end
