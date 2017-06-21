class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.references :bebida, foreign_key: true
      t.integer :cant

      t.timestamps
    end
  end
end
