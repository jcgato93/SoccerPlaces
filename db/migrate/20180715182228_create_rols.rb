class CreateRols < ActiveRecord::Migration[5.1]
  def change
    create_table :rols do |t|
      t.string :rol
      t.boolean :isActive

      t.timestamps
    end
  end
end
