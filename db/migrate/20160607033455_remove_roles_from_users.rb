class RemoveRolesFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :roles, :string
    remove_column :users, :first_login, :string
  end
end
