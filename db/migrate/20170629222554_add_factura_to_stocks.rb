class AddFacturaToStocks < ActiveRecord::Migration[5.0]
  def change
    add_column :stocks, :factura_compra, :string
  end
end
