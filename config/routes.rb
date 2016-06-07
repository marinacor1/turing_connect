Rails.application.routes.draw do
  root to: 'welcome#show'
  get '/users/map', to: 'users#index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get '/users', to: 'users#index'
    end
  end
end
