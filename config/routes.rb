Rails.application.routes.draw do
  root "happy_hours#index"

  resources :happy_hours

  get 'users/signin' => 'users#signin'
  resources :users, except: :destroy
end
