Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

# Add custom routes for logins
  post '/owner/login', to: 'auth#owner_login'
  post '/educator/login', to: 'auth#educator_login'
  post '/student/login', to: 'auth#student_login'

  # routes  
  resources :attendances, only: [:index, :show, :create, :update, :destroy]
  resources :lessons
  resources :answers, only: [:index, :show, :create, :update, :destroy]
  resources :questions, only: [:index, :show, :create, :update, :destroy]
  resources :discussions
  resources :educators, only: [:index, :show, :create, :update, :destroy]
  resources :exams, only: [:index, :show, :create, :update, :destroy] 
  resources :schools, only: [:index, :show, :create, :update, :destroy]
  resources :owners, only: [:create, :update, :destroy, :index]
  resources :resources, only: [:index, :show, :create, :update, :destroy]
  resources :students, only: [:index, :show, :create, :update, :destroy]
  resources :courses, only: [:index, :show, :create, :update, :destroy]  
end
