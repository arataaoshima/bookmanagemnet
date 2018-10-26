json.extract! reservation, :id, :user_id, :book_id, :start, :end, :checkin, :checkout, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
