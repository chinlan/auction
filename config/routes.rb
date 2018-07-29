Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products
  resources :line_items, only: [:create, :update, :destroy]
  resources :orders, only: :create
  resources :favorites, only: [:create, :destroy]
  namespace :my do
    resource :cart, only: [:show]
    resources :orders, only: [:index, :show]
    resources :sales_orders, only: [:index, :show]
    resources :favorites, only: :index
  end
end
