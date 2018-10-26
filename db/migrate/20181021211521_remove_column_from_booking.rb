class RemoveColumnFromBooking < ActiveRecord::Migration
  def change
    remove_column :bookings, :book, :string
  end
end
