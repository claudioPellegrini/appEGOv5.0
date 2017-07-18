class Api::ComprasController < ApplicationController

	def index
    	@compras = current_cuentum.compras.order('fecha DESC')
    	@compras.each do |compra|
    		if compra.present?
    			respond_to do |format|
    				format.json {render :json => {:compra => compra, :productos => compra.productos, :bebidas => compra.bebidas}}
    			end
    		end
    	end
	end
	

	def create
		compras = Compra.where(fecha: Time.now.to_date)
		compras.each do |c|
			if current_cuentum.id == c.cuentum_id
				flash[:error] = "Ya has realizado un compra hoy, no puedes repetir!!"
				redirect_to :action => "index"
			end
		end
		@bebidas = Bebida.all    
		@tipos = Tipo.all
		@menus = Menu.all
		@menus.each do |menu|
			if menu.fecha.to_date == Time.now.to_date
				@productos = menu.productos.all
			end
		end  
		@compra = Compra.new(compra_params)
  		

		@compra.save
			render json: @compra, status: :created
		
	end

	def destroy
		@compra = Compra.where(id: params[:id]).first
    	@bebidas = @compra.bebidas.all

		if @compra.destroy
			head(:ok)
		else
			head(:unprocessable_entity)
		end
	end


	private

	def compra_params
		# params.require(:compra).permit(:fecha, productos:[], bebidas:[])

		params.require(:compra).permit(:fecha, :productos, :bebidas)
	end

end
