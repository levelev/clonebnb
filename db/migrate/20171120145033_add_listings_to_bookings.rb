class AddListingsToBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :listing, foreign_key: true
  end
end
