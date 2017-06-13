class AddIndexToMenus < ActiveRecord::Migration[5.0]
  def change
    add_index :menus, :fecha, unique: true
  end
end
