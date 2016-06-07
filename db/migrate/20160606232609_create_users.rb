class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :cohort
      t.string :name
      t.string :current_employer
      t.string :github_id
      t.string :street_address
      t.string :city
      t.string :state
      t.string :lat
      t.string :long
      t.string :image
      t.string :oauth_token
      t.string :roles
      t.boolean :first_login
      t.string :email

      t.timestamps null: false
    end
  end
end
