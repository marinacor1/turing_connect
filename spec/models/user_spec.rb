require 'rails_helper'

RSpec.describe User, type: :model do

  it "returns to full street address" do
    user = User.create(street_address: "1223 Lane Street", city: "San Antonio", state: "TX")
    location = user.full_street_address
    expect(location).to eq("1223 Lane Street, San Antonio, TX")
  end

  describe "returns a list of all states with no repetition" do
    fixtures :users
    it "works" do
      user = User.create(street_address: "1223 Lane Street", city: "San Antonio", state: "TX")
      user2 = User.create(street_address: "123 Blue Street", city: "Dallas", state: "TX")
      user3 = User.create(street_address: "12 Kay Street", city: "Seattle", state: "WA")
      states = User.unique_states
      expect(states).to eq(["CO","TX","WA"])
    end
  end

  describe "returns a list of all chorts with no repetition" do
    fixtures :users
    it "works" do
    user = User.create(cohort: "1406", street_address: "1223 Lane Street", city: "San Antonio", state: "TX")
    user2 = User.create(cohort: "1406", street_address: "123 Blue Street", city: "Dallas", state: "TX")
    states = User.unique_cohorts
    expect(states).to eq(["1406", "1410", "1508", "1602"])
  end
  end

  describe "creates a new update using user information" do
    fixtures :users
    it "has a new update" do
      params = {"user"=>{"city"=>"New York City"}, "format"=>:json, "controller"=>"api/v1/users", "action"=>"update", "id"=>"1"}
      original_count = Update.all.count

      new_update = User.update_newsfeed(params)
      expect(new_update.user.name).to eq("Marina Corona")
      expect(new_update.cohort).to eq("1602")
      expect(new_update.action).to eq("updated their city.")
      expect(Update.all.count).to eq(1)
      end
    end

  describe "filter actions properly identifies changes" do
    fixtures :users
    it "tests for the correct change" do
      params = {"state"=>"VA"}

      action = User.filter_action(params)

      expect(action).to eq("updated their state.")
    end
  end

end
