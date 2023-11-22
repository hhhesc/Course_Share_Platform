Rails.application.routes.draw do
  resources :course_files

  devise_for :users, controllers: { sessions: 'users/sessions' ,users: 'users'}, sign_out: :destroy
  resources :users do
    member do
      get 'student_certificate'
      get 'follow'
      get 'unfollow'
      get 'list_followers'
      get 'list_followings'
      get 'list_favor_articles'
      get 'edit_personal_sign'
    end
  end

  resources :courses do
    resources :course_comments do
      member do
        get 'beLiked'
        get 'beUnliked'
      end
    end
    resources :course_scores
    resources :articles do
      member do
        get 'beLiked'
        get 'beUnliked'
        get 'beFavored'
        get 'beUnfavored'
      end
    end
    resources :course_files
    member do
      get 'list_comments'
      get 'list_articles'
      get 'list_course_files'
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
