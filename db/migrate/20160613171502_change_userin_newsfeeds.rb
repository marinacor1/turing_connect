class ChangeUserinNewsfeeds < ActiveRecord::Migration
  def change
    remove_column :newsfeeds, :user, :string
  end
end
