require 'rails_helper'

RSpec.feature "user can view all users list" do
  include FeatureHelper
  it "sees a list with links to user show" do
    user = User.create(cohort: "1602", name: "Marina Corona", screen_name: "marinacor1", city: "Dallas", state: "TX", github_id: ENV["github_uid"])

    user_login

    click_on 'Alumni'

    expect(current_path).to eq '/students'


    expect(page).to have_content "All Alumni"
  end
end
