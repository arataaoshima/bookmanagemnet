class User < ActiveRecord::Base
    has_many :reservations
    has_many :books, through: :reservations
end
