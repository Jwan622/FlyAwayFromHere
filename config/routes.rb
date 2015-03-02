Rails.application.routes.draw do
  get 'base/dashboard'

  root "categories#index"
  get "/about", to: "static_pages#about", as: "about"
  post "/login", to: "sessions#create", as: "login"
  get "/logout", to: "sessions#destroy", as: "logout"

  resources :users do
    resources :orders
  end

  resource :plan, only: [:new, :show]
  resources :categories, only: [:index]
  resources :trips, only: [:index]

  namespace :admin do
    get "/dashboard", to: "base#dashboard"
  end
end
