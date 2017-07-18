class AddValorFinalTicketToCompras < ActiveRecord::Migration[5.0]
  def change
    add_column :compras, :valorFinalTicket, :integer
  end
end
