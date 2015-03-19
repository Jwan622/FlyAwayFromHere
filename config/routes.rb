Rails.application.routes.draw do

  root "planners#new"
  get '/auth/:provider/callback', to: 'sessions#create'
  get "/about", to: "static_pages#about", as: "about"
  get "/logout", to: "sessions#destroy", as: "logout"
  post "/login", to: "sessions#create", as: "login"

  resources :users
  resources :categories, only: [:index]
  resources :real_trips, only: [:index, :show]
  resources :trip_infos, only: [:index, :show]
  resources :trips, only: [:index, :new, :show, :create, :destroy]
  resource :planner, only: [:new, :create]

  namespace :admin do
    get "/dashboard", to: "base#dashboard"
  end
end
