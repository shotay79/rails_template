Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :products
  resources :shopping_cart do
    member do
      post :add_to_cart
      delete :remove_from_cart
    end    
  end
  resources :orders

  root "products#index"
end
