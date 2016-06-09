require 'rails_helper'

RSpec.feature "visitor can see all users" do
  include FeatureHelper
  it "shows a list with attributes for user" do
    user = User.create(cohort: "1602", name: "Marina Corona", city: "Dallas", state: "TX", github_id: ENV["github_uid"])

    stub_omniauth
    visit root_path
    click_on "Sign in with Github"

    click_on "Map"

    expect(current_path).to eq(users_map_path)
    expect(page).to have_content("Cohort: 1602")
    expect(page).to have_content("Marina Corona")
    expect(page).to have_content("Location: Dallas, TX")
  end
end
