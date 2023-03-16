json.extract! charge, :id, :vehicle_type, :min_charge, :min_hours, :extra_hour_charges, :created_at, :updated_at
json.url charge_url(charge, format: :json)
