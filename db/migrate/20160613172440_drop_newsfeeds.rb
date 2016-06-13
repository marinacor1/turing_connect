class DropNewsfeeds < ActiveRecord::Migration
  def change
    drop_table :newsfeeds
  end
end
