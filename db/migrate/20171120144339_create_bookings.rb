class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.string :address
      t.references :user, foreign_key: true
      t.boolean :confirmed

      t.timestamps
    end
  end
end
