json.extract! booking, :id, :book, :start, :end, :created_at, :updated_at
json.url booking_url(booking, format: :json)
