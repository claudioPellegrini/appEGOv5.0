class MovimientoController < ApplicationController
  def index
  	@bebidas = Bebida.all
  	
  end
end
