class CreateSoccerCourts < ActiveRecord::Migration[5.1]
  def change
    create_table :soccer_courts do |t|
      t.string :name
      t.string :location
      t.decimal :price
      t.boolean :isActive

      t.timestamps
    end
  end
end
