json.extract! vehicle, :id, :charge_id, :number, :in_time, :out_time, :charges, :status, :user_id, :created_at, :updated_at, :owner
json.url vehicle_url(vehicle, format: :json)
