class ApplicationController < ActionController::Base
  
  acts_as_token_authentication_handler_for Cuentum, fallback: :none

  protect_from_forgery unless: -> { request.format.json? } 
  # protect_from_forgery with: :null_session
  

  before_action :authenticate_cuentum!
  
  
end
