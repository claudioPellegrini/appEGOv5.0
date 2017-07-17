class AddSalarioToUsuarios < ActiveRecord::Migration[5.0]
  def change
    add_column :usuarios, :salario, :integer
  end
end
