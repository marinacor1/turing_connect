require 'rails_helper'

RSpec.feature "authorized user can see all users" do
  include FeatureHelper
  it "shows a list with attributes for user" do
    user = User.create(cohort: "1602", name: "Marina Corona", city: "Dallas", state: "TX", github_id: ENV["github_uid"])

    user_login

    click_on "Map"

    expect(current_path).to eq(users_map_path)
  end
end
