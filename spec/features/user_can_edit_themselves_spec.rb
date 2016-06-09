require 'rails_helper'

RSpec.feature "user can edit themselves" do
  include FeatureHelper
  it "shows an updated user" do
    user = User.create(cohort: "1602", name: "Marina Corona", city: "Dallas", state: "TX", github_id: ENV["github_uid"])
    user2 = User.create(cohort: "1508", name: "Tina Turner", city: "Denver", state: "CO", github_id: ENV["github_uid"])

    stub_omniauth
    visit "/"

    click_on "Sign in with Github"

    expect(current_path).to eq(edit_user_path(user))
    within(".edit-user-form") do
      select( "1508", from: "Cohort")
      fill_in "Name", with: "Malcolm Gladwell"
      fill_in "Current Employer", with: "Denny's"
      fill_in "Street Address", with: "1510 Blake Street"
      fill_in "City", with: "Denver"
      select("CO", from: "State")
      fill_in "Email", with: "email@email.com"
      click_on "Submit"
    end

    expect(current_path).to eq user_path(user)
    expect(page).to have_content "1508"
    expect(page).to_not have_content "1602"
    expect(page).to have_content "Malcolm Gladwell"
    expect(page).to_not have_content "Marina Corona"
    expect(page).to have_content "Denny's"
    expect(page).to have_content "1510 Blake Street"
    expect(page).to have_content "Denver, CO"
    expect(page).to have_content "email@email.com"

  end
end
