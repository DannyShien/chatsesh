Rails.application.routes.draw do
  
  get "profile" => "users#edit"
  put 'update_profile' => "users#update"

  post "toggle_like" => "likes#toggle"
  
  get 'auth/:provider/callback' => 'sessions#callback'
  
 

  resources :posts do
    get :paging, on: :collection
  end
  
  resources :users do
    member do 
      get 'profile'
    end
  end
  
  resources :comments
  resources :friendships
  resources :posts, only: [:create]
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
  
  

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
