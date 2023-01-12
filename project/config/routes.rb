Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "posts#index"
  resources :posts
  resources :comments

  get '/top', to: 'pages#top', as: :top

  get '/user/:id/edit', to: 'users#edit', as: :edit_user

  get '/sign_up', to: 'users#sign_up', as: :sign_up
  get '/sign_in', to: 'sessions#sign_in', as: :sign_in
  get '/sign_out', to: 'users#sign_out'

  post 'sign_up', to: 'users#sign_up_process', as: :sign_up_process
  post 'sign_in', to: 'users#sign_in_process', as: :sign_in_process
end
