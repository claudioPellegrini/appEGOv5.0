class CuentaController < ApplicationController
	@prueba = ":)"
	before_action :authenticate_cuentum!

  def edit
    @cuenta = current_cuentum
  end

  def update_password
    @cuenta = Cuentum.find(current_cuentum.id)
    if @cuenta.update(cuentum_params)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@cuenta)
      redirect_to root_path
    else
      render "edit"
    end
  end

  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.require(:cuenta).permit(:password, :password_confirmation)
  end

end
