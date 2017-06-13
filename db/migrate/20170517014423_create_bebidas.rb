class CreateBebidas < ActiveRecord::Migration[5.0]
  def change
    create_table :bebidas do |t|
      t.string :nombre
      t.string :tipo
      t.string :tamanio
      t.decimal :precio

      t.timestamps
    end
  end
end
