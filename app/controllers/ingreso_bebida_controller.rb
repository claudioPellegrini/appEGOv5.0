class IngresoBebidaController < ApplicationController
	

	def index
		@bebida_recibida = Bebida.find(params[:bebida])
	end

	def update
		
	end


	def agregoCantidad 
		
		@bebida_stock = Bebida.find(params[:bebida])

		
		@cantidad = params[:cant].to_i
		
		if @bebida_stock != nil
			
			@bebida_stock.agrego(@cantidad)
		end
		redirect_to :action => 'index', :controller => 'movimiento'
	end
	

end
