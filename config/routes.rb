Rails.application.routes.draw do


  get 'movimiento/index'

  resources :compras
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
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'


  namespace :api, defaults: {format: 'json'} do
    resources :menus, only: [:index, :show]
  end
end
