Rails.application.routes.draw do
  get 'auth/:provider/callback' => 'sessions#callback'

  get "profile" => "users#edit"

  resources :messages do
    collection do
      get :inbox
      get :sent
    end
  end
  
  delete "remove_friend" => "friendships#destroy"
  
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy"
  resources :users
  resources :friendships
  
  

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
