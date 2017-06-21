class CreateCompraProductos < ActiveRecord::Migration[5.0]
  def change
    create_table :compra_productos do |t|
      t.references :compra, foreign_key: true
      t.references :producto, foreign_key: true

      t.timestamps
    end
  end
end
