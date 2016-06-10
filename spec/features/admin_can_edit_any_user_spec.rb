require 'rails_helper'

RSpec.feature "admin can edit anyone" do
  include FeatureHelper
  it "shows an updated user" do
    user = User.create(cohort: "1508")
    admin = User.create(name: "Michael Dao", cohort: "1410", city: "Denver", state: "CO", github_id: ENV["mike_uid"], role: 1)
    admin_omniauth
    visit "/"

    click_on "Sign in with Github"

    expect(current_path).to eq(admin_dashboard_path)

    click_on "View All Users"

    expect(current_path).to eq(admin_users_path)

    click_on "Update Marina Corona's Account"
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

    expect(current_path).to eq '/users/1'
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
