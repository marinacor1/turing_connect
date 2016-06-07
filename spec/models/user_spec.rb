require 'rails_helper'

RSpec.describe User, type: :model do
  it "converts location to viewable city and state" do
    user = User.create(city: "San Antonio", state: "TX")
    location = user.city_and_state(user)
    expect(location).to eq("San Antonio, TX")
  end
end
