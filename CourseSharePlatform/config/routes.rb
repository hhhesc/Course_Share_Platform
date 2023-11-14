Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' ,users: 'users'}, sign_out: :destroy
  resources :users

  resources :courses do
    resources :course_comments
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "welcome/index" => "welcome#index"

  # Defines the root path route ("/")
  root "welcome#index"
end
