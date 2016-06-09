require 'rails_helper'

RSpec.feature "visitor can only see landing page" do
  include FeatureHelper
  it "shows error page if unauthorized" do
    user = User.create(cohort: "1602", name: "Marina Corona", city: "Dallas", state: "TX", github_id: ENV["github_uid"])

    visit users_map_path

    expect(page).to have_content "Looks like you are not authorized to access Turing Connect."

    visit user_path(user)

    expect(page).to have_content "Looks like you are not authorized to access Turing Connect."

    visit edit_user_path(user)

    expect(page).to have_content "Looks like you are not authorized to access Turing Connect."

  end
end
