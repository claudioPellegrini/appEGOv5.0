class IngresoBebidaController < ApplicationController
	

	def index
		@bebida_recibida = Bebida.find(params[:bebida])
		
	end

	def update
		
	end


	def agregoCantidad	

		@bebida_stock = Bebida.find(params[:bebida])

		@cantidad = params[:cant].to_i
		raise @cantidad.to_yaml
		if @bebida_stock != nil
			raise @cantidad.to_yaml
			@bebida_stock.agrego(@cantidad)
		end
		redirect_to :action => 'index', :controller => 'movimiento'
	end


end
