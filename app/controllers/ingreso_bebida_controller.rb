class IngresoBebidaController < ApplicationController
	def index
		@bebida_recibida = Bebida.find(params[:bebida])
	end

	def update
		
	end

end
