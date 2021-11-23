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
   resources :carts, only: [:show] do 
      member do
        get :new_item
        post :add_item
      end
    end
end

