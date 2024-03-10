Rails.application.routes.draw do
  devise_for :user
  root to: "prototypes#index"
   resources :prototypes, only: :new 
end
