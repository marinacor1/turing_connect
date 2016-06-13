require 'rails_helper'

RSpec.feature "user cannot edit another user" do
  include FeatureHelper
  it "returns a flash message and gives 404 error" do
    user = User.create(cohort: "1508", name: "Sabrina Smith", city: "Miami", state: "FL")
    user2 = User.create(cohort: "1608", name: "Marina Corona", city: "Los Angeles", state: "CA")

    user_login

    visit edit_user_path(user)

    expect(page).to have_content "Looks like you are not authorized to access Turing Connect."
  end
end
