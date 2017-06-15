class CreateVenta < ActiveRecord::Migration[5.0]
  def change
    create_table :venta do |t|
      t.integer :menu_id
      t.integer :bebida_id

      t.timestamps
    end
  end
end
