require 'rails_helper'

RSpec.feature "user can see repo newsfeed" do
  include FeatureHelper
  it "sees when add a new repo" do
    user = User.create(cohort: "1602", name: "Marina Corona", screen_name: "marinacor1", city: "Dallas", state: "TX", github_id: ENV["github_uid"])

    user_login

    click_on "Newsfeed"

    expect(current_path).to eq newsfeed_path
    
    expect(page).to have_content "Welcome to your Newsfeed"
  end
end
