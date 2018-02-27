Rails.application.routes.draw do
root 'pages#index'
resources :hikes, except: :post
post '/users/:id' => 'hikes#create_from_existing', as: :post_hike
post '/hikes' => 'hikes#create'
resources :users
delete '/logout' => 'sessions#destroy', as: :logout
resources :sessions, only: [:new, :create]
end
