class CreateEmpresas < ActiveRecord::Migration[5.0]
  def change
    create_table :empresas do |t|
      t.integer :rut
      t.string :nombre
      t.string :razon_social
      t.integer :telefono
      t.string :direccion
      t.string :email

      t.timestamps
    end
  end
end
