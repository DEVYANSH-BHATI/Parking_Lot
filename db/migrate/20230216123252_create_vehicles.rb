class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.integer :charge_id
      t.string :number
      t.timestamp :in_time
      t.timestamp :out_time
      t.integer :charges
      t.string :status
      t.integer :user_id

      t.timestamps
    end
  end
end
