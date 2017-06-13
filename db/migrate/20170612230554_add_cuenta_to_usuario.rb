class AddCuentaToUsuario < ActiveRecord::Migration[5.0]
  def change
  	add_column :usuarios, :cuenta_id, :integer
  end
end
