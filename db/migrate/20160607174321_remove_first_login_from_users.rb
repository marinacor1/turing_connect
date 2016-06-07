class RemoveFirstLoginFromUsers < ActiveRecord::Migration
  def change
    change_column :users, :first_login, :string, default: true
  end
end
