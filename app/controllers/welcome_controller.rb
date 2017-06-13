class WelcomeController < ApplicationController
  def index
  	@usuarios = Usuario.all
  	@usuarios.each do |u| 
        if cuentum_signed_in? && current_cuentum.id == u.cuenta_id
  			@nombre = u.nombres
  			if u.rol == "ADMINISTRADOR"
  				@div_admin = true
  			end
	  		if u.rol == "USUARIO" 
	  			@div_usuario = true
	  		end
	  		if u.rol == "OPERARIO" 
	  			@div_opera = true
	  		end

  		end
  		
    end 
  	
  	
  end
end
