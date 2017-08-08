Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  get "logout" => "sessions#destroy"
  get "login" => "sessions#new"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  root "home#index"
end
