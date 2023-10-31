Rails.application.routes.draw do
  root "users#index"
  resources :users
  resources :tweets
  post "top/login"
  get "top/main"
  get "top/logout"
  resources "likes"
  #post "likes", to: "likes#create"
  #delete "likes/:id", to: "likes#destroy"
end
