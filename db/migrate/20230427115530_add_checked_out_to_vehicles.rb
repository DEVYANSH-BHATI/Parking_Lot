class AddCheckedOutToVehicles < ActiveRecord::Migration[7.0]
  def change
    add_column :vehicles, :checkout, :boolean
  end
end
