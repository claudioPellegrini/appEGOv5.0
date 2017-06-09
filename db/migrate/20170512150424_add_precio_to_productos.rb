class AddPrecioToProductos < ActiveRecord::Migration[5.0]
  def change
    add_column :productos, :precio, :decimal
  end
end
