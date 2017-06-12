class WelcomeController < ApplicationController
  def index
  	if usuario_signed_in?
  		@nombre = current_usuario.nombres
  	end
  	if current_usuario.rol == "ADMINISTRADOR"
  		@div_admin = true
  	end
  	if current_usuario.rol == "USUARIO"
  		@div_usuario = true
  	end
  end


end
