class Seed

  def initialize
    create_admin
    add_1602
    add_1511
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
    User.create(name: "Gurusundesh Khalsa", github_id: '11367377', cohort: "1602", city: "Denver", state: "CO") #sunny
  end

  def add_1511
   User.create(name: "Nicholas Dorans", cohort: "1511", github_id: '13855453', city: "Denver", state: "CO") #nick
   User.create(name: "July Tran", cohort: "1511", github_id: "14022835", city: "Golden", state: "CO")
  end
end

Seed.new
