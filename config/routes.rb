Rails.application.routes.draw do
  root "sessions#welcome"

  resources :groups do
  resources :group_volunteers, only: [:create, :destroy]
  patch :update_two, on: :member    # 👈 adds update_two_group_path(:id)
end


  resources :volunteers
  resources :users

  get  "/login"  => "sessions#new"
  post "/login"  => "sessions#create"
  get  "/signup" => "users#new"
  post "/signup" => "users#create"
  get  "/logout" => "sessions#destroy"
  delete "/logout" => "sessions#destroy"

  get "/auth/:provider/callback" => "sessions#omniauth"
end
