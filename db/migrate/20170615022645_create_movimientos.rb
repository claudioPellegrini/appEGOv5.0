class CreateMovimientos < ActiveRecord::Migration[5.0]
  def change
    create_table :movimientos do |t|
      t.integer :id_bebida
      t.datetime :fecha
      t.integer :cant

      t.timestamps
    end
  end
end
