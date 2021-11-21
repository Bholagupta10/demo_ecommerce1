Rails.application.routes.draw do

  get 'users/index'
  devise_for :users
  root to: "products#index"
  resources :products do
      member do 
        post 'buy_now'
      end    
   end
end

