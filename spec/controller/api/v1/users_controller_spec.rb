require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  it "GET index" do
    user = User.create(cohort: "1606", name: "Andy Swanson", current_employer: "AlamoU", github_id: "482", street_address: "910 Santa Fe Dr.", city: "Denver", state: "CO")

    id = user.id
    get :index
    parsed_json = JSON.parse(response.body)

    expect(response).to eq(:success)
    expect(parsed_json.last["name"]).to eq("Andy Swanson")
    expect(parsed_json.first["current_employer"]).to eq("AlamoU")
  end
end
