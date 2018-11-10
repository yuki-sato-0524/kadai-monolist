Rails.application.routes.draw do
  
  root to: "toppages#index"
  
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  

  get "signup" => "users#new"
  resources :users, only:[:new,:show,:create]
  
end
