Rails.application.routes.draw do
  mount ApiAuth::Engine => '/api_auth'
  namespace :api do
    resources :users
  end
end
