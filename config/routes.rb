Rails.application.routes.draw do
  root to: 'welcome#show'
  get '/users/map', to: 'users#index'
  get "/auth/github", as: :github_login
  get "/auth/github/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy", as: :logout
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get '/users', to: 'users#index'
    end
  end
end
