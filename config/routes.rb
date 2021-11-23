Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  root to: "products#index"
  resources :products do
    member do 
      post 'buy_now'
      post 'add_now'
    end    
   end
   resources :carts, only:[:index,:show] do 
    member do
      get :new_item
      get 'carts/index',to: 'carts#index'
    end
    end
end