Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "auth/get_csrf_token", to: "auth#get_csrf_token"
      post "auth/login", to: "auth#login"
      post "auth/logout", to: "auth#logout"
      get  "user/profile", to: "users#profile"
      post "user/log_out", to: "users#log_out"
      resources :lists, only: %i(index create update destroy)
      resources :users
    end
  end
end
