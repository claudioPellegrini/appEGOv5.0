class AddCuentaToCompras < ActiveRecord::Migration[5.0]
  def change
    add_reference :compras, :cuenta, foreign_key: true
  end
end
