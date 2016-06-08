require 'rails_helper'
require 'feature_helper'

RSpec.feature "user logs in with github account" do
  include FeatureHelper
  scenario "user will see request to authorize access using github" do
    User.create(cohort: "1602", name: "Marina Corona", github_id: ENV["github_uid"])

    stub_omniauth
    visit "/"

    click_on "Sign in with Github"

    expect(page.status_code).to eq(200)
    expect(page).to have_content "Marina"
    expect(page).to have_link "Logout"
  end

  scenario "user who is not authorized will see error page" do
    User.create(cohort: "1602", name: "Marina Corona", github_id: ENV["github_uid"])
    stub_unauthorized_omniauth

    visit "/"

    click_on "Sign in with Github"

    expect(page.status_code).to eq(404)
    expect(page).to have_content "Looks like you are not authorized to access"

  end
end
