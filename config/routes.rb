Rails.application.routes.draw do
  devise_for :user
  root to: "prototypes#index"
   resources :prototypes, only: [:new,:create] 
   resources :users, only: [:show] 
end
