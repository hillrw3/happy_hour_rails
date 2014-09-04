Rails.application.routes.draw do
  root "happy_hours#index"
  get "signin" => "sessions#new", as: :signin
  get "signout" => "sessions#destroy", as: :signout

  resources :happy_hours
  resources :sessions
  resources :users
  resources :categories
end
