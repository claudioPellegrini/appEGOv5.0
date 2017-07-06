class BarcodeController < ApplicationController
	skip_before_action :authenticate_cuentum!


	def index    
    	@usuario = nil
  		$usuarioBarcode = nil
 	end

 	def get_barcode		
		ci = params[:cedula][:ci]
		@usuario = Usuario.find_by(ci: ci)		  	
		if @usuario == nil	  		
		  	flash[:error] = "Usuario no valido, por favor comuniquese con el Administrador!"
		  	redirect_to :action => "index"
		else
		  	$usuarioBarcode = @usuario	  		
		end		
  	end

  	def new
  		get_barcode
	    @barcode = Compra.new
	    @bebidas = Bebida.all
	    
	    @tipos = Tipo.all
	    @menus = Menu.all
	    @menus.each do |menu|
	      if menu.fecha.to_date == Time.now.to_date
	        @productos = menu.productos.all
	      end  
	    end 
 	end

 	def create
	    @bebidas = Bebida.all   
	    @menus = Menu.all
	    @menus.each do |menu|
	      if menu.fecha.to_date == Time.now.to_date
	        @productos = menu.productos.all
	      end  
	    end 	    
	    cuenta = Cuentum.find_by(id: $usuarioBarcode.cuenta_id)
	    # byebug
	    @compra = cuenta.compras.new(compra_params)
	    @compra.fecha =Time.now
	    @compra.productos = params[:productos]
	    @compra.bebidas = params[:bebidas]
	    # @compra.save
	    
	    if @compra.save	    	
	      	redirect_to :action => "show"  
	    end
	      	   
  	end

  	def show
  		@message = ">>>	La Compra se realizo exitosamente!!"
  		@usuario = nil
  		$usuarioBarcode = nil
  	end

  	def id_params
      params.require(:cedula).permit(:ci)
    end

  	def compra_params
      params.require(:compra).permit(:fecha, :productos, :bebidas)
    end
end
