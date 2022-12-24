Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "boards#index"
  resources :boards, only: [:show] do
    resources :threads, only: [:show]
  end
end
