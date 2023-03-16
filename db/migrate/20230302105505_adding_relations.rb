class AddingRelations < ActiveRecord::Migration[7.0]
  def change
    add_reference(:vehicles,:user,foreign_key: true )
    add_reference(:vehicles,:charges,foreign_key:true )
  end
end
