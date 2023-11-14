Rails.application.routes.draw do

  resources :courses do
    resources :course_comments
  end
  devise_for :users
  resources :users do
    collection do
      get 'login'
      post 'do_login'
      get 'logout'
      get 'register'
      post 'do_register'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "welcome/index" => "welcome#index"

  # Defines the root path route ("/")
  root "welcome#index"
end
