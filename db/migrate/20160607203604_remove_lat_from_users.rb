class RemoveLatFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :lat, :string
    remove_column :users, :long, :string
  end
end
