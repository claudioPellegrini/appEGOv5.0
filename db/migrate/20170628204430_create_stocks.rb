class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.integer :bebida_id
      t.integer :cant

      t.timestamps
    end
  end
end
