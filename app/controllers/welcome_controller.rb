class WelcomeController < ApplicationController
  def index
    @usuarios = Usuario.all
    if current_cuentum.email == "admin@admin.com"
        @div_admin = true
    end
    @usuarios.each do |u| 
        if cuentum_signed_in? && current_cuentum.id == u.cuenta_id
        @nombre = u.nombres
        if current_cuentum.email == "admin@admin.com" || u.rol == "ADMINISTRADOR"
          @div_admin = true 
          @nombre = u.rol         
        end
        
        if u.rol == "USUARIO" 
          @div_usuario = true
        end
        if u.rol == "OPERARIO" 
          @div_opera = true
        end
        if u.habilitado == false
          @div_opera = false
          @div_usuario = false
          flash[:error] = "Su usuario no está habilitado, comuniquese con el Administrador"
        end

      end
      
    end 
    
    
  end
end
