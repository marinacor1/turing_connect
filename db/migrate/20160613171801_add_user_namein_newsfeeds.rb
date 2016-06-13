class AddUserNameinNewsfeeds < ActiveRecord::Migration
  def change
    add_column :newsfeeds, :user_name, :string
  end
end
