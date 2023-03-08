class AddVehicleTypeToVehicle < ActiveRecord::Migration[7.0]
  def change
    add_column :vehicles ,:vehicle_type,:string
  end
end
