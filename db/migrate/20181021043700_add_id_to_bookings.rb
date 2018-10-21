class AddIdToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :user_id, :integer
    add_column :bookings, :book_id, :integer 
  end
end
