Rails.application.routes.draw do

  get '/mypage', to: 'users#mypage'
  
  root "posts#index"
  resources :posts
  resources :comments

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
end
