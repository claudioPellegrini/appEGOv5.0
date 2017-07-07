class ComprasController < ApplicationController
  before_action :set_compra, only: [:show, :edit, :update, :destroy]

  # GET /compras
  # GET /compras.json
  def index
    @compras = current_cuentum.compras.order('fecha DESC')
  end

  # GET /compras/1
  # GET /compras/1.json
  def show
    @bebidas = Bebida.all
    @productos = Producto.all
    @productos_en_compra = Array.new
    @bebidas_en_compra = Array.new
    compra_prod_bd = CompraProducto.where(compra_id: @compra.id)
    compra_beb_bd = CompraBebida.where(compra_id: @compra.id)
     compra_prod_bd.each do |prod|
        @productos.each do |p|
          if prod.producto_id == p.id
            @productos_en_compra.push(p)
          end
        end         
      end
      compra_beb_bd.each do |beb|
        @bebidas.each do |b|
          if beb.bebida_id == b.id
            @bebidas_en_compra.push(b)
          end
        end         
      end

    @tipos =Tipo.all
  end

  # GET /compras/new
  def new
    @compra = Compra.new
    @bebidas = Bebida.all
    
    @tipos = Tipo.all
    @menus = Menu.all
    @menus.each do |menu|
      if menu.fecha.to_date == Time.now.to_date
        @productos = menu.productos.all
      end  
    end 
  end

  # GET /compras/1/edit
  def edit
    @tipos =Tipo.all
    @menus = Menu.all
    @bebidas =Bebida.all
    @menus.each do |menu|
      if menu.fecha.to_date == Time.now.to_date
        @productos = menu.productos.all
      end  
    end 
  end

  # POST /compras
  # POST /compras.json
  def create
    
    @bebidas = Bebida.all   
    @menus = Menu.all
    @menus.each do |menu|
      if menu.fecha.to_date == Time.now.to_date
        @productos = menu.productos.all
      end  
    end 
    

    @compra = current_cuentum.compras.new(compra_params)
    @compra.fecha =Time.now
    @compra.productos = params[:productos]
    @compra.bebidas = params[:bebidas]
    

    respond_to do |format|
      if @compra.save
        format.html { redirect_to @compra, notice: 'La Compra fue creada correctamente.' }
        format.json { render :show, status: :created, location: @compra }
      else
        format.html { render :new }
        format.json { render json: @compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /compras/1
  # PATCH/PUT /compras/1.json
  def update
    @tipos =Tipo.all
    @menus = Menu.all
    @bebidas =Bebida.all
    @menus.each do |menu|
      if menu.fecha.to_date == Time.now.to_date
        @productos = menu.productos.all
      end  
    end 
    respond_to do |format|
      if @compra.update(compra_params)
        format.html { redirect_to @compra, notice: 'Compra actualizada correctamente.' }
        format.json { render :show, status: :ok, location: @compra }
      else
        format.html { render :edit }
        format.json { render json: @compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compras/1
  # DELETE /compras/1.json
  def destroy
    @bebidas = @compra.bebidas.all
    
    @compra.destroy
    respond_to do |format|
      format.html { redirect_to compras_url, notice: 'La Compra fue eliminada correctamente.' }
      format.json { head :no_content }
    end
  end



  private


    # Use callbacks to share common setup or constraints between actions.
    def set_compra
      @compra = Compra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compra_params
      params.require(:compra).permit(:fecha, :productos, :bebidas)
    end

  

end
