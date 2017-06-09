class Addtipoaproductos < ActiveRecord::Migration[5.0]
  def change
  	add_reference :productos, :tipo, foreign_key: true
  end
end
