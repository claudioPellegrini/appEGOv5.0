class Api::MenusController < ApplicationController
	before_action :set_menu, only: [:show]
 
  def index
    @menu = Menu.last
    respond_to do |format|
      format.json  { render :json => {:menu => @menu, 
                                  :productos => @menu.productos }}
end
  end
 
  def show
  end
 
  
 
  private
    def set_menu
      @menu = Menu.find(params[:id])
    end


 
    
end
