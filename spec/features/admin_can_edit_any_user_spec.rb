require 'rails_helper'

RSpec.feature "admin can edit anyone" do
  include FeatureHelper
  it "shows an updated user", js:true do
    user = User.create(cohort: "1508", name: "Sabrina Smith", city: "Miami", state: "FL")
    admin = User.create(name: "Michael Dao", cohort: "1410", city: "Denver", state: "CO", github_id: ENV["mike_uid"], role: 1)
    user2 = User.find_by(name: "Marina Corona")

    admin_omniauth
    visit "/"

    click_on "Sign in with Github"

    expect(current_path).to eq(admin_dashboard_path)

    click_on "Edit Accounts"

    expect(current_path).to eq('/admin/users/')

    click_on "Update Marina Corona's Account"

    expect(current_path).to eq(user_path(user2))

    expect(page).to have_content "Denver"

    find(".user-detail-city").click
    find(".user-detail-city").native.send_keys("New York City")
    find(".page-header").click

    expect(page).to have_content "DenverNew York City"
    expect(page).to_not have_content "Miami"
    expect(page).to_not have_content "Denver"

  end
end
