class DatabaseModify < ActiveRecord::Migration[7.0]
  def up
    remove_column(:vehicles,:user_id)
    remove_column(:vehicles,:charge_id)

  end

  def down
    add_column(:vehicles,:user_id,:integer)
    add_column(:vehicles,:charge_id ,:integer)
  end
end
