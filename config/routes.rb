Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users

  resources :products
  namespace :shopping_cart do
    get '/items', to: 'shopping_cart#items', as: 'cart_items_path'
    post '/items/:product_id', to: 'shopping_cart#add_item', as: 'add_items_path'
  end
  root "products#index"
end
