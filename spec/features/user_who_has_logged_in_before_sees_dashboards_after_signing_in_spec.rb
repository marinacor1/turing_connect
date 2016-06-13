require 'rails_helper'

RSpec.feature "user who has logged in before sees dashboard after signing in" do
  include FeatureHelper
  it "shows dashboard" do
    user =User.create(cohort: "1602", city: "Sacramento", state: "CA", name: "Marina Corona", github_id: ENV["github_uid"], first_login: false)

    stub_omniauth

    visit "/"

    click_on "Sign in with Github"

    click_on "Logout"

    visit "/"

    click_on "Sign in with Github"

    expect(current_path).to eq(newsfeed_path)

    expect(user.first_login).to eq(false)
  end
end
