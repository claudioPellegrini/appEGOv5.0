class AddProductoToMenus < ActiveRecord::Migration[5.0]
  def change
    add_reference :menus, :producto, foreign_key: true
  end
end
