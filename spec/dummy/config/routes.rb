Rails.application.routes.draw do
  mount ApiAuth::Engine => '/api_auth'
end
