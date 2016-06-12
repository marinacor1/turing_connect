require 'rails_helper'

RSpec.feature "user can see repo newsfeed" do
  include FeatureHelper
  it "sees when add a new repo" do
    user = User.create(cohort: "1602", name: "Marina Corona", city: "Dallas", state: "TX", github_id: ENV["github_uid"])

    user_login

    click_on "Dashboard"

    within ".repo-newsfeed" do
      expect(page).to have_content "Marina added a repo"
    end
  end
end
