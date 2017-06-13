class AddEmpresaToUsuarios < ActiveRecord::Migration[5.0]
  def change
    add_reference :usuarios, :empresa, foreign_key: true
  end
end
