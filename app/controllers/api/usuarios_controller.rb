class Api::UsuariosController < ApplicationController
	# skip_before_action :authenticate_cuentum!
	
	def index
		
		
		
		# @usuario = Usuario.find_by(ci: '3677985')
		# byebug
		# cuenta = Cuentum.find_by(email: 'admin@admin.com')
		# current_cuentum = cuenta
		@usuarios = Usuario.all
		# byebug
		render json: @usuarios, status: :ok
	end

	def create
		@usuario = Usuario.new(usuario_params)

		@usuario.save
		render json: @usuario, status: :created
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

	def usuario_params
		params.require(:usuario).permit(:ci, :nombres, :apellidos, :rol, :habilitado, :empresa_id, :cuenta_id)
	end
end
