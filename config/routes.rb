Rails.application.routes.draw do
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get 'dashboard', to: 'sessions#show'
  delete '/login', to: 'sessions#destroy'

  get 'users/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :communities

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :communities, only: %i[index create show destroy]
      resources :users, only: %i[create]
      post "/login", to: "users#login"
    end
  end

  resources :categories, only: %i[index show]
end
