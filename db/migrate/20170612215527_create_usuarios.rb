class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios do |t|
      t.integer :ci
      t.string :nombres
      t.string :apellidos
      t.string :rol
      t.boolean :habilitado

      t.timestamps
    end
  end
end
