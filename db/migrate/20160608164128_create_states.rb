class CreateStates < ActiveRecord::Migration
  def change
    create_table :states, id: false do |t|
      t.string :state_code, null: false
      t.string :state_name
    end
    add_index :states, :state_code, unique: true
  end
end
