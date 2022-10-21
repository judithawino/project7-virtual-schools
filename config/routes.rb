Rails.application.routes.draw do
  resources :schools, only: [:index]
  resources :owners, only: [:create, :update, :destroy, :index]
  
end
