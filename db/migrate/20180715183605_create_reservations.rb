class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.date :dateOfReservation
      t.time :timeOfReservation
      t.boolean :isActive
      t.decimal :price

      t.timestamps
    end
  end
end
