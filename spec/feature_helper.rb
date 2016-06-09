module FeatureHelper
  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      extra: {
        raw_info: {
                    id: ENV["github_uid"],
                    name: "Marina Corona",
                    avatar_url: "ljsfls",
                    },

      },
      credentials: {
        token: ENV["github_token"]
      },
          info: {
            image: "https://avatars.githubusercontent.com/u/14285122?v=3"
          }
      })
  end

  def stub_unauthorized_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      extra: {
        raw_info: {
                    id: "034090",
                    name: "Marina Corona",
                    avatar_url: "ljsfls",
                    },

      },
      credentials: {
        token: ENV["github_token"]
      },
          info: {
            image: "https://avatars.githubusercontent.com/u/14285122?v=3"
          }
      })
  end

end
