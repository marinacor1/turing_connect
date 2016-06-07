class AddFirstLoginToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_login, :boolean, default: false
  end
end
