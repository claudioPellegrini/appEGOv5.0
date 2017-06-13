class CreateTieneProductos < ActiveRecord::Migration[5.0]
  def change
    create_table :tiene_productos do |t|
      t.references :menu, foreign_key: true
      t.references :producto, foreign_key: true

      t.timestamps
    end
  end
end
