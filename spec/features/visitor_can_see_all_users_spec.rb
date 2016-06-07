require 'rails_helper'

RSpec.feature "visitor can see all users" do
  it "shows a list with attributes for user" do
    visit root_path
    click_on "All Users"

    expect(path).to eq(users_map_path)

    expect(page).to have_content("Name:")
    expect(page).to have_content("Current Employer:")
    expect(page).to have_content("Location:")
  end
end
