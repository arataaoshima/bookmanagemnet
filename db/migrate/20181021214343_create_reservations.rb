class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :book_id
      t.date :start
      t.date :end
      t.string :checkin
      t.string :checkout

      t.timestamps null: false
    end
  end
end
