Rails.application.routes.draw do

  root to: "static#home"

  resources :customers
  resources :appointments
  resources :employees do
    resources :appointments, only: [:new, :create, :index]
  end

  get "/signup", to: "users#new", as: "signup"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy", as: "destroy_user_session"

  get "/employee_login", to: "sessions#new_employee", as: "employee_login"
  post "/employee_login", to: "sessions#create_employee"

  match '/auth/:google_oath2/callback' => "sessions#google", via: [:get, :post]

end
