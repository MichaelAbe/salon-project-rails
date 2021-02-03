Rails.application.routes.draw do

  root to: "static#home"

  resources :customers
  resources :appointments
  resources :employees do
    resources :appointments, only: [:new, :create, :index]
  end

  get "/signup", to: "users#new", as: "signup"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new", as: "signup"
  post "/login", to: "sessions#create

  delete "/logout", to: "sessions#destroy", as: "destroy_user_session"

end



