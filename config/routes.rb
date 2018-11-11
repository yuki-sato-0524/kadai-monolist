Rails.application.routes.draw do
  
  root to: "toppages#index"
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get "signup" => "users#new"
  resources :users, only:[:new,:show,:create]
  
  resources :items, only: [:show, :new]
  resources :ownerships, only: [:create, :destroy]
  
  get "ranking/want" => "rankings#want"
  get "ranking/have" => "rankings#have"
  
end
