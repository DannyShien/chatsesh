Rails.application.routes.draw do
  get "friendship/create"
  get "sessions/new" => "sessions#new" 

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  #resources :friendships
  post "friendship/create" => "friendship#create"

  get "logout" => "sessions#destroy"
  get "login" => "sessions#new"
  post "login" => "sessions#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  post "remove_friend" => "friendship#destroy"
end
