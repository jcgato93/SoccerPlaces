class AddRolIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :rol, index: true
    # add_column :users, :rol_id,index: true
   add_foreign_key :users, :rols
  end
end
