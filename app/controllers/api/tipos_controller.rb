class Api::TiposController < ApplicationController
	# skip_before_action :authenticate_cuentum!
	before_filter :authenticate_cuentum!, :except => [:index]
	def index
		
		
		
		# @usuario = Usuario.find_by(ci: '3677985')
		# byebug
		# cuenta = Cuentum.find_by(email: 'admin@admin.com')
		# current_cuentum = cuenta
		@tipos = Tipo.all
		if @tipos.present?
	        respond_to do |format|
	        format.json  { render :json => {:results => @tipos, 
	                                    }}
      		end
      	end
	end
	
	# def show
	# 	respond_with Usuario.find(params[:id])
	# end

	# def create
	# 	@usuario = Usuario.new(usuario_params)

	# 	 @usuario.save
	# 		render json: @usuario, status: :created
		
	# end

	# def destroy
	# 	@usuario = Usuario.where(id: params[:id]).first
	# 	if @usuario.destroy
	# 		head(:ok)
	# 	else
	# 		head(:unprocessable_entity)
	# 	end
	# end


	# private

	# def usuario_params
	# 	params.require(:usuario).permit(:ci, :nombres, :apellidos, :rol, :habilitado, :empresa_id, :cuenta_id)
	# end
end
