class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_usuario!

  before_filter :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
        	# devise_parameter_sanitizer.**permit**(:sign_up, keys: [:ci, :nombres, :apellidos, :habilitado, :rol, :email, :password])
        	# devise_parameter_sanitizer.**permit**(:account_update, keys: [:ci, :nombre, :email, :password, :current_password, :apellidos, :habilitado, :rol])
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:ci, :nombres, :apellidos, :habilitado, :rol, :email, :password) }
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:ci, :nombre, :email, :password, :current_password, :apellidos, :habilitado, :rol) }
        end
end
