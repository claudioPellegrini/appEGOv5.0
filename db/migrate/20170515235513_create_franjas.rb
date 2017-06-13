class CreateFranjas < ActiveRecord::Migration[5.0]
  def change
    create_table :franjas do |t|
      t.datetime :fecha
      t.decimal :primera_hasta
      t.decimal :primera_precio
      t.decimal :segunda_hasta
      t.decimal :segunda_precio
      t.decimal :tercera_precio

      t.timestamps
    end
  end
end
