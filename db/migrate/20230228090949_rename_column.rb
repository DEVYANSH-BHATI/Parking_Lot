class RenameColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :charges, :type, :vehicle_type
  end
end
