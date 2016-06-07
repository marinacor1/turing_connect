class ChangeFirstLoginFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :first_login, :string, default: true
  end
end
