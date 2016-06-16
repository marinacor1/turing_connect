require 'rails_helper'

RSpec.feature "user can see repo newsfeed" do
  include FeatureHelper
  it "sees when add a new repo" do
    user = User.create(cohort: "1602", name: "Marina Corona", screen_name: "marinacor1", city: "Dallas", state: "TX", github_id: ENV["github_uid"])

    user_login

    visit '/g_newsfeed'

    expect(current_path).to eq g_newsfeed_path

    expect(page).to have_content "Welcome to your Github Newsfeed"
  end
end
