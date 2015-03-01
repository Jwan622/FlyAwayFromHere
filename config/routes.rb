Rails.application.routes.draw do
  root "categories#index"
  get "/about", to: "static_pages#about", as: "about"
  post "/login", to: "sessions#create", as: "login"
  get "/logout", to: "sessions#destroy", as: "logout"

  resources :users do
    resources :orders
  end
end
