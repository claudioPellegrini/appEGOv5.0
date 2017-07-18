class ChangeNameColumnValorFinalTicketToCompras < ActiveRecord::Migration[5.0]
  def change
     rename_column :compras, :valorFinalTicket, :valor_final_ticket
   end
end
