class AddDefaultToUsers < ActiveRecord::Migration
  def change
    change_column :users, :image, :string, :default => "https://avatars1.githubusercontent.com/u/7934292?v=3&s=200"
  end
end
