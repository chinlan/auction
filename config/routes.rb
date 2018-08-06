Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :carts
    resources :favorites
    resources :line_items
    resources :orders
    resources :orders_users
    resources :products

    root to: "users#index"
  end
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: "products#index"
  resources :products
  resources :line_items, only: [:create, :update, :destroy]
  resources :orders, only: :create
  resources :favorites, only: [:create, :destroy]
  resources :images, only: :destroy
  resources :avatars, only: :destroy
  namespace :my do
    resource :cart, only: [:show]
    resources :orders, only: [:index, :show]
    resources :sales_orders, only: [:index, :show]
    resources :favorite_sellers, only: :index
    resources :favorite_products, only: :index
  end
end
