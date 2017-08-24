class Api::MenusController < ApplicationController
  before_filter :authenticate_cuentum!, :except => [:index]
  
	before_action :set_menu, only: [:show]
 

  def index
    @menu = Menu.where(fecha: Time.now).last
    
    if @menu.present?
        respond_to do |format|
          format.json  { render :json => {:results =>[:menu => @menu, 
                                      :productos => @menu.productos]}}
      end
    end
  end
 
  def show
  end
 
  
 
  private
    def set_menu
      @menu = Menu.find(params[:id])
    end



 
    
end
