Rails.application.routes.draw do


  resources :venta
  resources :stocks
  resources :movimientos
  devise_for :usuarios
  resources :menus do
  	resources :productos
  end

  resources :empresas
  resources :venta
  get 'welcome/index'

  resources :bebidas
  resources :franjas
  resources :productos
  resources :tipos
  resources :usuarios
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'


  namespace :api, defaults: {format: 'json'} do
    resources :menus, only: [:index, :show]
  end
end
