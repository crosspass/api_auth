Rails.application.routes.draw do
  resources :users
  mount ApiAuth::Engine => "/api_auth"

  namespace :api do
    resources :clients
  end
end
