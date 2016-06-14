class ChangeColumnDefaultUser < ActiveRecord::Migration
  def change
    change_column_default(:users, :current_employer, 'none')
    change_column_default(:users, :email, 'none')
    change_column_default(:users, :status, 'none')
  end
end
