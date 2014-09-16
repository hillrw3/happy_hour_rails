Rails.application.routes.draw do
  root "locations#index"
  get "signin" => "sessions#new", as: :signin
  get "signout" => "sessions#destroy", as: :signout
  get "/all_locations" => "locations#list", as: :all_locations

  resources :locations
  resources :sessions
  resources :users
  resources :categories
end
