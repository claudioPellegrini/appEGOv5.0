class CalificaController < ApplicationController
	# before_action :set_compra
  def new
  	# @valor = params[:valor]
  	# byebug
  	# puts "probando"
  	# byebug
  	

  	 byebug
  	@compra = Compra.find(params[:@compra])
		

  end
  

  def create
  	@valor = params[:valor]
  	# @compra = params[:compra]
  	# Compras.where(menu_id: self.id).destroy_all
  	byebug
  end
  
  def set_compra
  	@compra = Compra.find(params[:compra])
  end

end
