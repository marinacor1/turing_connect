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

RSpec.feature "user logs in with github account" do
  scenario "user will see request to authorize access using github" do
    stub_omniauth
    visit "/"
    save_and_open_page
    click_on "Login Using Github"

    expect(page.status_code).to eq(200)
    expect(page).to have_content "Marina"
    expect(page).to have_link "Logout"
  end
end
