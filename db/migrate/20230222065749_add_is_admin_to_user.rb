class AddIsAdminToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_Admin, :boolean
  end
end
