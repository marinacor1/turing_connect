class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.references :user, index: true, foreign_key: true
      t.string :cohort
      t.string :action

      t.timestamps null: false
    end
  end
end
