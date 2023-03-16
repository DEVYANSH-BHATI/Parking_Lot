class RenameColumn < ActiveRecord::Migration[7.0]
  def up
    rename_column :charges, :type, :vehicle_type
  end

  def down
    rename_column :charges,:vehicle_type,:type
  end
end
