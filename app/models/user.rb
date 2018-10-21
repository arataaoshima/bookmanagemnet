class User < ActiveRecord::Base
    has_many :bookings
    has_many :books, through: :bookings
end
