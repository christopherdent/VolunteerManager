# config/routes.rb
Rails.application.routes.draw do
  root "sessions#welcome"          # 👈 this line gives you root_path / root_url

  resources :groups
  resources :volunteers
  resources :users
  resources :group_volunteers

  get  "/login"  => "sessions#new"
  post "/login"  => "sessions#create"
  get  "/signup" => "users#new"
  post "/signup" => "users#create"
  get  "/logout" => "sessions#destroy"
  delete "/logout" => "sessions#destroy"

  # … (all your nested routes stay the same) …

  get "/auth/:provider/callback" => "sessions#omniauth"
end
