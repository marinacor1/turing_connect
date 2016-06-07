require 'rails_helper'

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      extra: {
        raw_info: {
                    uid: ENV["github_uid"],
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
                    uid: "0340",
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
RSpec.feature "user logs in with github account" do
  xscenario "user will see request to authorize access using github" do
    User.create(cohort: "1602", name: "Marina Corona", github_id: ENV["github_uid"])

    stub_omniauth
    visit "/"

    click_on "Login Using Github"

    expect(page.status_code).to eq(200)
    expect(page).to have_content "Marina"
    expect(page).to have_link "Logout"
  end

  scenario "user who is not authorized will see error page" do
    User.create(cohort: "1602", name: "Marina Corona", github_id: ENV["github_uid"])
    stub_unauthorized_omniauth

    visit "/"

    click_on "Login Using Github"

    expect(page.status_code).to eq(404)
    expect(page).to have_content "The page you were looking for doesn't exist"

  end
end
