class AddColumnIsActiveForUsersTable < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_active, :integer, :default => 0
  end
end
