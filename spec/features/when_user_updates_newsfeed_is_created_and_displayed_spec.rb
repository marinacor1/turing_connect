require 'rails_helper'

RSpec.feature "when user updates newsfeed" do
  include FeatureHelper
  it "creates and displays news", js: true do
    user = User.create(cohort: "1602", name: "Marina Corona", city: "Los Angeles", state: "CA", github_id: ENV["github_uid"], first_login: false)

    stub_omniauth
    visit "/"

    click_on "Sign in with Github"

    visit user_path(user)

    find(".user-detail-status").click
    find(".user-detail-status").native.send_keys("Looking for a job in NYC!")
    find(".page-header").click

    visit '/newsfeed'

    expect(page).to have_content "Marina Corona in 1602 updated their status: noneLooking for a job in NYC!"
  end
end
