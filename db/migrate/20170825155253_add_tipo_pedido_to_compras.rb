class AddTipoPedidoToCompras < ActiveRecord::Migration[5.0]
  def change
    add_column :compras, :tipo_pedido, :string
  end
end
