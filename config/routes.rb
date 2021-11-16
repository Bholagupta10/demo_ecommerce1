Rails.application.routes.draw do

  get 'users/index'
  devise_for :users
  # resources :users
  root to: "products#index"
  # get 'products/index'
  # devise_for :products 
  # root to: "home#index"
  # root 'static_pages#home'
  # resources :products
  resources :products do
    resources :comments
  end

end

