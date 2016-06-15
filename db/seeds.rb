class Seed

  def initialize
    create_cohorts
    create_admin
    add_1602
    add_1511
  end

  def create_cohorts
    users = User.create!([ {city: "Juneau", cohort: "1406", state: "AK"}, {cohort: "1407", city: "Birmingham", state: "AL"}, {cohort: "1409", city: "Little Rock", state: "AR"}, {cohort: "1410", city: "Phoenix", state: "AZ"}, {cohort: "1412", city: "Sacramento", state: "CA"}, {cohort: "1502", city: "Golden", state: "CO"}, {cohort: "1503", city: "Hartford", state: "CT"}, {cohort: "1505", city: "Washington", state: "DC"}, {cohort: "1507", city: "Dover", state: "DE"}, {cohort: "1510", city: "Miami", state: "FL"}, {cohort: "1511", city: "Atlanta", state: "GA"}, {cohort: "1602", city: "Honolulu", state: "HI"}, {cohort: "1603", city: "Iowa City", state: "IA"}, {cohort: "1605", city: "Ketchum", state: "ID"}, {cohort: "1406", city: "Chicago", state: "IL"}, {cohort: "1406", city: "Indianapolis", state: "IN"}, {cohort: "1406", city: "Kansas City", state: "KS"}, {cohort: "1406", city: "Florence", state: "KY"}, {cohort: "1406", city: "New Orleans", state: "LA"}, {cohort: "1406", city: "Boston", state: "MA"}, {cohort: "1406", city: "Baltimore", state: "MD"}, {cohort: "1406", city: "Portland", state: "ME"}, {cohort: "1406", city: "Detroit", state: "MI"}, {cohort: "1406", city: "Minneapolis", state: "MN"}, {cohort: "1406", city: "Kansas City", state: "MO"}, {cohort: "1406", city: "Biloxi", state: "MS"}, {cohort: "1406", city: "Billings", state: "MT"}, {cohort: "1406", city: "Durham", state: "NC"}, {cohort: "1406", city: "Fargo", state: "ND"}, {cohort: "1406", city: "Omaha", state: "NE"}, {cohort: "1406", city: "Manchester", state: "NH"}, {cohort: "1406", city: "Trenton", state: "NJ"}, {cohort: "1406", city: "Taos", state: "NM"}, {cohort: "1406", city: "Las Vegas", state: "NV"}, {cohort: "1406", city: "New York", state: "NY"}, {cohort: "1406", city: "Marietta", state: "OH"}, {cohort: "1406", city: "Oklahoma City", state: "OK"}, {cohort: "1406", city: "Portland", state: "OR"}, {cohort: "1406", city: "Pittsburgh", state: "PA"}, {cohort: "1406", city: "San Juan", state: "PR"}, {cohort: "1406", city: "Providence", state: "RI"}, {cohort: "1406", city: "Charleston", state: "SC"}, {cohort: "1406", city: "Sioux Falls", state: "SD"}, {cohort: "1406", city: "Nashville", state: "TN"}, {cohort: "1406", city: "Austin", state: "TX"}, {cohort: "1406", city: "Salt Lake City", state: "UT"}, {cohort: "1406", city: "Annapolis", state: "VA"}, {cohort: "1406", city: "Burlington", state: "VT"}, {cohort: "1406", city: "Seattle", state: "WA"}, {cohort: "1406", city: "Madison", state: "WI"}, {cohort: "1406", city: "Charleston", state: "WV"}, {cohort: "1406", city: "Cheyenne", state: "WY"} ])
    puts "Cohorts created"
  end

  def create_admin #marina, mike, marissa, city and state are validated.
    #name not included because would appear on map
    User.create!([
      {github_id: '19890634', role: 1, street_address: "1510 Blake Street", city: "Denver", state: "CO"}
      ])
      mike = User.find_by(name: "Michael Dao")
      mike.update(role: 1)
      mike.save

      marina = User.find_by(name: "Marina Corona")
      marina.update({role: 1, oauth_token: ENV["oath_token"]})
      marina.save
    puts "Admin created"
  end

  def add_1602
    User.create(github_id: '11367377', city: "Denver", state: "C)") #sunny
  end

  def add_1511
   User.create(github_id: '13855453', city: "Denver", state: "CO") #nick
  end
end

Seed.new
