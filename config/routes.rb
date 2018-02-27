Rails.application.routes.draw do
root 'pages#index'
resources :hikes, except: :post 
post '/hikes/:id' => 'users#show', as: :post_hike
post '/hikes' => 'hikes#create'
resources :users
delete '/logout' => 'sessions#destroy', as: :logout
delete '/hikes/:id' => 'hikes#destroy', as: :delete_hike
resources :sessions, only: [:new, :create]
end
