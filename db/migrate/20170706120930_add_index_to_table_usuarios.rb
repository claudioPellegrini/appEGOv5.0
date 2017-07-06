class AddIndexToTableUsuarios < ActiveRecord::Migration[5.0]
  def change
  	add_index :usuarios, :ci,                unique: true
  end
end
