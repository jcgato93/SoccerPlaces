class AddSoccerCourtIdToReservations < ActiveRecord::Migration[5.1]
  def change
    add_reference :reservations, :soccer_court, foreign_key: true
  end
end
