class RemoveRolIdToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :rol_id, :integer
  end
end
