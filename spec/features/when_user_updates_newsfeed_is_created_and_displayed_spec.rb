require 'rails_helper'

RSpec.feature "when user updates newsfeed" do
  include FeatureHelper
  it "creates and displays news" do
    user = User.create(cohort: "1602", name: "Marina Corona", city: "Dallas", state: "TX", github_id: ENV["github_uid"])
    original_count = Newsfeed.all.count
    user_login

    expect(current_path).to eq(edit_user_path(user))
    within(".edit-user-form") do
      fill_in "Current Focus:", with: "Looking for a job in NYC!"
    end

    expect(Newsfeed.all.count).to eq(1)

    visit '/newsfeed'

    expect(page).to have_content "Marina updated her status: Looking for a job in NYC!"
  end
end
