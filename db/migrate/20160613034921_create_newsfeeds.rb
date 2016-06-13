class CreateNewsfeeds < ActiveRecord::Migration
  def change
    create_table :newsfeeds do |t|
      t.string :user
      t.string :cohort
      t.string :action

      t.timestamps null: false
    end
  end
end
