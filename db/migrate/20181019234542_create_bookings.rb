class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :book
      t.date :start
      t.date :end

      t.timestamps null: false
    end
  end
end
