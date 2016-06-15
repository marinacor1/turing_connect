class AddDefaultstoUser < ActiveRecord::Migration
  def change
    change_column :users, :cohort, :string, :default => "none"
    change_column :users, :name, :string, :default => "none"
    change_column :users, :street_address, :string, :default => "none"
    change_column :users, :street_address, :string, :default => "none"
  end
end
