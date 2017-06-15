class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.integer :id_producto
      t.integer :saldo

      t.timestamps
    end
  end
end
