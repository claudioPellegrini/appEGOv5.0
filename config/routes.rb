Rails.application.routes.draw do


  get 'movimiento/index'
  get 'ingreso_bebida/index' => 'ingreso_bebida#index', :as => :index
   get 'ingreso_bebida/agregoCantidad' 

  resources :compras
  resources :barcode
  get 'barcode/show'
  post 'barcode/new'

  resources :venta
  devise_for :cuenta 

  resource :cuenta, only: [:edit] do
  collection do
    patch 'update_password'
  end
end


  resources :usuarios
  resources :menus do
  	resources :productos
  end

  resources :empresas

  get 'welcome/index'

  resources :bebidas
  resources :franjas
  resources :productos
  resources :tipos


  resources :stocks
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'


  namespace :api, defaults: {format: 'json'} do
    resources :menus, only: [:index, :show]
    # resource :session, only: [:create]
    resources :usuarios
    resource :sessions, only: [:create, :destroy]
    # resources :cuentum, only: [:index]
  end
end
