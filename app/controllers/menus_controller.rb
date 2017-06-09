class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.order('fecha DESC').all
    @productos = Producto.all
    @tiene_productos = TieneProducto.all
    @tipos = Tipo.all
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
    @tipos = Tipo.all
  end

  # GET /menus/new
  def new
    @menu = Menu.new
    @productos = Producto.all
    @tipos = Tipo.all
  end

  # GET /menus/1/edit
  def edit
    @productos = Producto.all
    @tipos = Tipo.all
    
  end

  # POST /menus
  # POST /menus.json
  def create
    @tipos = Tipo.all
    @productos = Producto.all
    @menu = Menu.new(menu_params)
    @menu.productos = params[:productos]
    if @menu.productos == nil
      format.html { render :new, notice: 'Debe seleccionar al menos 1 producto.' }
    else
      respond_to do |format|
        if @menu.save
          format.html { redirect_to @menu, notice: 'El Menu se ha creado correctamente .' }
          format.json { render :show, status: :created, location: @menu }
        else
          format.html { render :new }
          format.json { render json: @menu.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    respond_to do |format|
      @menu.productos = params[:productos]
      if @menu.update(menu_params)

        format.html { redirect_to @menu, notice: 'El Menu se ha editado correctamente.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to menus_url, notice: 'El Menu se ha eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:fecha, :productos, :producto_id)
    end
  end

  def chequeada(valor)    
    @productos.each do |prod|
        @menu.productos.each do |p|
          if p.id == valor 
            return true          
        end
      end
      return false    
   end



end
