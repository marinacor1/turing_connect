Rails.application.routes.draw do
  root to: 'welcome#show'
  get '/users/map', to: 'users#index' 
end
