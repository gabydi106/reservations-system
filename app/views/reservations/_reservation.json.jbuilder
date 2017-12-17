json.extract! reservation, :id, :checkin, :checkout, :guest_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
