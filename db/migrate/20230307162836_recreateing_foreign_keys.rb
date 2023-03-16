class RecreateingForeignKeys < ActiveRecord::Migration[7.0]
  def change
    remove_reference :vehicles, :charges, foreign_key: true, index: false
  end
end
