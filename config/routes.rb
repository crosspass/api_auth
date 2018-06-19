ApiAuth::Engine.routes.draw do
  resources :requests
  resources :apis
  resources :clients do
    get :toggle_api, on: :member
  end
  
  root to: 'clients#index'
end
