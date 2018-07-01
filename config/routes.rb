Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products
  resource :cart, only: [:show, :create]
  resources :line_items, only: [:create, :update, :destroy]
  resources :orders, only: :create
  namespace :my do
    resources :orders, only: [:index, :show]
    resources :products, only: [:index, :show]
  end
end
