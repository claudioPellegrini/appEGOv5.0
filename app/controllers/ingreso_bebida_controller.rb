class IngresoBebidaController < ApplicationController
	

	def index
		@bebida_recibida = Bebida.find(params[:bebida])
		
	end

	def update
		
	end


	def agregoCantidad(beb)	

		@cantidad = params[:cantidad]
		beb.agrego(@cantidad)
		redirect_to :action => 'index', :controller => 'movimiento'
	end


end
