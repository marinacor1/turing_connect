require 'rails_helper'

RSpec.describe Api::V1::UsersController do
  describe "GET index" do
    it "shows all people" do

    get :index, format: :json
    users = JSON.parse(response.body)

    expect(response).to have_http_status(:success)
    expect(response.status).to eq(200)
    expect(users.last["name"]).to eq("Michael Dao")
    expect(users.first["current_employer"]).to eq("none")
    expect(users.count).to eq(4)
  end
end
end
