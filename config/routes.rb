Rails.application.routes.draw do
  root "planners#new"

  get 'sessions/create'
  get 'sessions/destroy'

  post "/bargains", to: "bargainer#create", as: "bargainer"
  get "/bargains", to: "bargainer#index", as: "bargains"

  get '/auth/:provider/callback', to: 'sessions#create'

  get "/about", to: "static_pages#about", as: "about"
  post "/login", to: "sessions#create", as: "login"
  get "/logout", to: "sessions#destroy", as: "logout"

  resources :users do
    resources :orders
  end

  resources :categories, only: [:index]
  resources :trips, only: [:index, :new, :create, :destroy]
  resource :planner, only: [:new, :create]
  resource :itinerary, only: [:new, :create, :show]

  namespace :admin do
    get "/dashboard", to: "base#dashboard"
  end
end
