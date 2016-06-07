require 'csv'

desc "Import former students from csv"
task import: :environment do
  filename = File.join Rails.root, "db/data/alumni_data.csv"
  CSV.foreach(filename, headers: true) do |row|
    User.create(row.to_hash)
  end
end
