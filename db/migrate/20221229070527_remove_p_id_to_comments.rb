class RemovePIdToComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :p_id
  end
end
