Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :products do
    # member do
    #   post :add_to_cart
    #   delete :remove_from_cart
    # end    
  end
  resources :shopping_cart do
    member do
      post :add_to_cart
      delete :remove_from_cart
    end    
  end


  # post 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  # delete 'products/remove_from_cart/;id', to: 'products#remove_from_cart', as: 'remove_from_cart' 
  
  root "products#index"
end
