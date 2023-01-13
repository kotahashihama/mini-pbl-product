Rails.application.routes.draw do
  root "posts#index"
  resources :posts
  resources :comments

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  get "/sign-up", to: "users#new"
  get "/login", to: "sessions#new"
end
