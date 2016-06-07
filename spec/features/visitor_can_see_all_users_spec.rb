require 'rails_helper'

RSpec.feature "visitor can see all users" do
  it "shows a list with attributes for user" do
    User.create(cohort: "1606", name: "Andy Swanson", current_employer: "AlamoU", github_id: "482", street_address: "910 Santa Fe Dr.", city: "Denver", state: "CO")
    visit root_path

    click_on "All Users"

    expect(current_path).to eq(users_map_path)
    expect(page).to have_content("Cohort: 1606")
    expect(page).to have_content("Name: Andy Swanson")
    expect(page).to have_content("Current Employer: AlamoU")
    expect(page).to have_content("Location: Denver, CO")
  end
end
