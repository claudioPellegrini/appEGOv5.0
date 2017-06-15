class AddCuentumToVenta < ActiveRecord::Migration[5.0]
  def change
    add_reference :venta, :cuentum, foreign_key: true
  end
end
