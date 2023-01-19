Rails.application.routes.draw do

  root "posts#index"
  get 'sign_in'  =>  'sessions#new'
  post 'sign_in'  =>  'sessions#create'
  delete 'sign_out' =>  'sessions#destroy'

  resource :users
  resource :session, only: [:create, :destroy]
  resources :posts
  resources :comments

  devise_for :users,
    path: '',
    path_names: {
      sign_up: '',
      sign_in: 'login',
      sign_out: 'logout',
      registration: "signup",
    },
    controllers: {
      registrations: "users/registrations",
      sessions: "users/sessions"
    }
end
