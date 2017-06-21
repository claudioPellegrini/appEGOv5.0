class CreateCompras < ActiveRecord::Migration[5.0]
  def change
    create_table :compras do |t|
      t.date :fecha

      t.timestamps
    end
  end
end
