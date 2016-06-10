require 'rails_helper'

RSpec.describe "user", :type => :controller do
  xdescribe "GET index" do
    it "shows all people" do
    user = User.create(cohort: "1616", name: "Andy Swanson", current_employer: "AlamoU", github_id: "482", street_address: "910 Santa Fe Dr.", city: "Denver", state: "CO")
    user2 = User.create(cohort: "1606", name: "Sam Jones", current_employer: "Turing", github_id: "482", street_address: "910 Santa Fe Dr.", city: "Austin", state: "TX")
    id = user.id
    get '/users/map'

    users = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(users.last["name"]).to eq("Andy Swanson")
    expect(users.first["current_employer"]).to eq("AlamoU")
    expect(users.count).to eq(1)
  end
end
end
