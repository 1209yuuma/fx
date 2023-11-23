Rails.application.routes.draw do
  get 'diaries/new'
  get 'sessions/new'
  root "pages#home"
  get  "/signup", to: "users#new"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  resources :users
  resources :diaries
  resources :posts
  resources :comments
  resources :posts do
    resources :comments
  end
end
