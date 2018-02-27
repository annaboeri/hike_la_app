Rails.application.routes.draw do
root 'pages#index'
resources :hikes
resources :users
delete '/logout' => 'sessions#destroy', as: :logout
resources :sessions, only: [:new, :create]
end
