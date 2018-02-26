Rails.application.routes.draw do
  get 'pages/index'

root 'hikes#index'
resources :hikes
resources :users
delete '/logout' => 'sessions#destroy', as: :logout
resources :sessions, only: [:new, :create]
end
