class IngresoBebidaController < ApplicationController
	

	def index
		@bebida_recibida = Bebida.find(params[:bebida])
		
	end

	def update
		
	end


	def agregoCantidad	

		@bebida_stock = params[:bebida_recibida]
		@cantidad = params[:cantidad]
		# @bebida_stock.agrego(@cantidad)
		redirect_to :action => 'index', :controller => 'movimiento'
	end


end
