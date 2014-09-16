Rails.application.routes.draw do
  root "happy_hours#index"
  get "signin" => "sessions#new", as: :signin
  get "signout" => "sessions#destroy", as: :signout
  get "/all_locations" => "happy_hours#list", as: :all_locations

  resources :happy_hours
  resources :sessions
  resources :users
  resources :categories
end
