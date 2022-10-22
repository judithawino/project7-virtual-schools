Rails.application.routes.draw do

  resources :questions, only: [:index, :show, :create, :update, :destroy]


  resources :discussions
  resources :educators


  resources :exams, only: [:index, :show, :create, :update, :destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :schools, only: [:index]
  resources :owners, only: [:create, :update, :destroy, :index]
  resource :course
  
end
