require 'rails_helper'

RSpec.feature "user does not have admin rights" do
  include FeatureHelper
  it "returns 404 page" do
    user = User.create(cohort: "1508", name: "Sabrina Smith", city: "Miami", state: "FL")
    user2 = User.create(cohort: "1608", name: "James Larson", city: "Los Angeles", state: "CA")

    user_login

    visit edit_user_path(user)

    expect(page).to have_content "Looks like you are not authorized to access Turing Connect."

    visit admin_users_path

    expect(page).to have_content "Looks like you are not authorized to access Turing Connect."

  end
end
