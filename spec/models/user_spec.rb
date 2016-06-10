require 'rails_helper'

RSpec.describe User, type: :model do
  it "converts location to viewable city and state" do
    user = User.create(city: "San Antonio", state: "TX")
    location = user.city_and_state(user)
    expect(location).to eq("San Antonio, TX")
  end

  it "returns to full street address" do
    user = User.create(street_address: "1223 Lane Street", city: "San Antonio", state: "TX")
    location = user.full_street_address
    expect(location).to eq("1223 Lane Street, San Antonio, TX")
  end

  it "returns a list of all states with no repetition" do
    user = User.create(street_address: "1223 Lane Street", city: "San Antonio", state: "TX")
    user2 = User.create(street_address: "123 Blue Street", city: "Dallas", state: "TX")
    user3 = User.create(street_address: "12 Kay Street", city: "Seattle", state: "WA")
    states = User.unique_states
    expect(states).to eq(["CO","TX","WA"])
  end

  it "returns a list of all chorts with no repetition" do
    user = User.create(cohort: "1406", street_address: "1223 Lane Street", city: "San Antonio", state: "TX")
    user2 = User.create(cohort: "1406", street_address: "123 Blue Street", city: "Dallas", state: "TX")
    user3 = User.create(cohort: "1510", street_address: "12 Kay Street", city: "Seattle", state: "WA")
    states = User.unique_cohorts
    expect(states).to eq(["1406","1510", "1602", "1606"])
  end

end
