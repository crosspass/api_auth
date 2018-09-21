ApiAuth::Engine.routes.draw do
  resources :clients
  resources :requests
  resources :apis
  resources :clients do
    member do
      get :apis
      put :toggle_api
    end
  end

  root to: 'clients#index'
end
