Rails.application.routes.draw do


  post '/educator/login', to: 'auth#educator_login'
  post '/login', to: 'auth#owner_login'
  # delete '/logout', to: 'sessions#logout'
  resources :attendances, only: [:index, :show, :create, :update, :destroy]

  resources :lessons

  resources :answers, only: [:show, :create, :update, :destroy]

  resources :questions, only: [:index, :show, :create, :update, :destroy]



  resources :discussions
  resources :educators, only: [:index, :show, :create, :update, :destroy]


  resources :exams, only: [:index, :show, :create, :update, :destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :schools, only: [:index, :show, :create, :update, :destroy]
  resources :owners, only: [:create, :update, :destroy, :index]
  resources :resources, only: [:index, :show, :create, :update, :destroy]
  resources :students, only: [:index, :show, :create, :update, :destroy]
  resources :courses, only: [:index, :show, :create, :update, :destroy]
  
end
