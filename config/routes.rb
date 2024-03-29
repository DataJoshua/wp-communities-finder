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
  resources :categories, only: %i[index show]

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :communities
      resources :categories, only: %i[index show]
      resources :users, only: %i[create]
      post "/login", to: "users#login"
      get "/dashboard", to: "users#show"
    end
  end

  namespace :admin, module: "admin" do
    resources :communities, only: %i[index destroy]
  end
end
