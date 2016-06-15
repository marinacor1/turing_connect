Rails.application.routes.draw do
  root to: 'welcome#show'
  get '/users/map', to: 'users#index'
  get '/g_newsfeed', to: 'events#index', as: :g_newsfeed
  get '/newsfeed', to: 'updates#index', as: :newsfeed
  get '/students', to: 'students#index', as: :students
  resources :users, only: [:show, :edit, :update]

  get "/auth/github", as: :github_login
  get "/auth/github/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy", as: :logout
  delete "/logout", to: "sessions#destroy"

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get 'users', to: 'users#index'
      resources :users, only: [:edit, :update]
    end
  end

  namespace :admin do
    get '/dashboard', to: 'users#show'
    resources :users, only: [:update, :delete, :index]
  end
end

#users index is map
#admin/users index is users index
