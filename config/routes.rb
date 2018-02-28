Rails.application.routes.draw do
root 'pages#index'
resources :users
resources :sessions, only: [:new, :create]
resources :hikes, except: :post 
post '/hikes/:id' => 'hikes#create_from_existing', as: :post_hike
post '/hikes' => 'hikes#create'
delete '/logout' => 'sessions#destroy', as: :logout
delete '/hikes/:id' => 'hikes#destroy', as: :delete_hike
get '/hikes/:id/reviews/new' => 'reviews#new', as: :reviews
post '/hikes/:id/reviews/new' => 'reviews#create', as: :post_review

end
