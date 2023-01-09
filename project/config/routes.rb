Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "posts#index"
  resources :posts
  resources :comments

  get "/sign-up", to: "users#new"
  get "/login", to: "sessions#new"
end
