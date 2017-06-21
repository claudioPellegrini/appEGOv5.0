class AddCuentumToCompras < ActiveRecord::Migration[5.0]
  def change
    add_reference :compras, :cuentum, foreign_key: true
  end
end
