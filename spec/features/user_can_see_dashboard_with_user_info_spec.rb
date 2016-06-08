require 'rails_helper'
require 'feature_helper'

RSpec.feature "user can see dashboard with user info" do
  include FeatureHelper
  it "user will see all correct attributes for him or herself" do
    user = User.create(cohort: "1602", name: "Marina Corona", github_id: ENV["github_uid"]. first_login: false)

    stub_omniauth
    visit "/"

    click_on "Sign in with Github"

    click_on "Logout"


    expect(current_path).to eq user_path(user)

    expect(page.status_code).to eq(200)
    expect(page).to have_content "Hello, Marina Corona"
    expect(page).to have_content "Cohort: 1602"
  end
end
