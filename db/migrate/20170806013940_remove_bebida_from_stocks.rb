class RemoveBebidaFromStocks < ActiveRecord::Migration[5.0]
  def change
    remove_column :stocks, :bebida_id, :integer
  end
end
