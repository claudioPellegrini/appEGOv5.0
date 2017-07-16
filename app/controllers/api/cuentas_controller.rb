class Api::CuentasController < ApplicationController
	def index
		
		
		
		# @usuario = Usuario.find_by(ci: '3677985')
		# byebug
		# cuenta = Cuentum.find_by(email: 'admin@admin.com')
		# current_cuentum = cuenta
		@cuentas = Cuentum.all
		# byebug
		render json: @cuentas, status: :ok
	end
	
	def show
		respond_with Cuentum.find(params[:id])
	end

	def create
		@cuenta = Cuentum.new(cuenta_params)
		byebug
		 @cuenta.save
			render json: @cuenta, status: :created
		
	end

	def destroy
		@usuario = Usuario.where(id: params[:id]).first
		if @usuario.destroy
			head(:ok)
		else
			head(:unprocessable_entity)
		end
	end


	private

	def cuenta_params
		byebug
		
		params.require(:cuenta).permit(:email, :password, :password_confirmation)
	end
end
