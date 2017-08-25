class Api::SessionsController < ApplicationController
	 before_filter :authenticate_cuentum!, :except => [:create, :destroy]
	  include Devise::Controllers::Helpers
	# skip_before_action :authenticate_cuentum!
	
	def create		
    	resource = Cuentum.where(email: params[:email]).first
      # byebug
  		if resource.valid_password?(params[:password])
  			sign_in("Cuentum", resource)
  			# session[:cuentum_id] = resource.id
  		  # render json: resource.as_json(only: [:email, :authentication_token]), status: :created
  		  render :json=> {:success=>true, :authentication_token=>resource.authentication_token, :email=>resource.email, status: :created}
        # render :json=> { :authentication_token=>resource.authentication_token}
  		  
        # byebug
      else
    		head(:unauthorized)
 		end
 	end

 	def destroy 
 		valor = current_cuentum
 		# byebug
 		reset_session
 		head(:ok)
 		
 	end

 	

end
