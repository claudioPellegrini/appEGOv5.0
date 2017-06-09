class RemoveProductosFromMenu < ActiveRecord::Migration[5.0]
  def change
    remove_column :menus, :producto_id, :integer
  end
end
