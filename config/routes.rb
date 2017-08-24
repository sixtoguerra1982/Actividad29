Rails.application.routes.draw do
  resources :histories
  root "histories#index"
  get 'users/sign_up', to: 'users#new'
  get 'users/sing_in', to: 'sessions#new'
  post 'users', to: "users#create"
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
