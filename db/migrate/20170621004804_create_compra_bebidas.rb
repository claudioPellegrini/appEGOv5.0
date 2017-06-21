class CreateCompraBebidas < ActiveRecord::Migration[5.0]
  def change
    create_table :compra_bebidas do |t|
      t.references :compra, foreign_key: true
      t.references :bebida, foreign_key: true

      t.timestamps
    end
  end
end
