class Api::SessionController < ApplicationController
	 before_filter :authenticate_cuentum!, :except => [:create, :destroy]

	def create
 	 usuario = Cuentum.where(email: params[:email]).first
  		if usuario.valid_password?(params[:password])
  		  render json: usuario.as_json(only: [:email, :authentication_token]), status: :created
  		else
    		head(:unauthorized)
 		end
 	end

end