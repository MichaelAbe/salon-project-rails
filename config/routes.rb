Rails.application.routes.draw do

  root to: "static#home"

  resources :customers
  resources :appointments
  resources :employees do
    resources :appointments, only: [:new, :create, :index]
  end

  get "/signup", to: "users#new", as: "signup"
  post "/signup", to: "users#create"
 
end
