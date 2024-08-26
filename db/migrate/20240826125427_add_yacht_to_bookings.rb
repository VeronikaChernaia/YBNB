class AddYachtToBookings < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :yacht, null: false, foreign_key: true
  end
end
