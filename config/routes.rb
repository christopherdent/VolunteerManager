Rails.application.routes.draw do
  root "sessions#welcome"

  resources :groups do
    # keep DELETE scoped to a group
    resources :group_volunteers, only: [:destroy]

    # custom member action for your add-from-select form
    patch :update_two, on: :member
  end

  # flat routes so Volunteers#show can open the form without a group context
  resources :group_volunteers, only: [:new, :create]

  resources :volunteers
  resources :users

  get    "/login"                   => "sessions#new"
  post   "/login"                   => "sessions#create"
  get    "/signup"                  => "users#new"
  post   "/signup"                  => "users#create"
  get    "/logout"                  => "sessions#destroy"
  delete "/logout"                  => "sessions#destroy"

  get "/auth/:provider/callback"    => "sessions#omniauth"
end
