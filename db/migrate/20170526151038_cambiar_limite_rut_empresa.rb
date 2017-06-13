class CambiarLimiteRutEmpresa < ActiveRecord::Migration[5.0]
  def change
  	change_column :empresas, :rut, :bigint, limit: 12 
  	change_column :empresas, :telefono, :bigint, limit: 12 
  end
end
