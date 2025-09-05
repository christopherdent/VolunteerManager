Rails.application.routes.draw do
  root "sessions#welcome"

  get "/health",  to: "health#ok"
  get "/dbcheck", to: "health#db"

  resources :groups do
    resources :group_volunteers, only: [:destroy]
    patch :update_two, on: :member
  end

  resources :group_volunteers, only: [:new, :create]
  resources :volunteers
  resources :users

  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  get    "/signup", to: "users#new"
  post   "/signup", to: "users#create"
  get    "/logout", to: "sessions#destroy"
  delete "/logout", to: "sessions#destroy"
end
