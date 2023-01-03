Rails.application.routes.draw do
  root "posts#index"
  resources :posts
  get 'posts/delete/:id', to: "posts#destroy"
  post 'post/update/:id', to: "posts#update"
  post 'comments/create', to: "comments#create"
  get 'comments/delete/:id', to: "comments#destroy"
  get "sing-up", to: "users#new"
  get "login", to: "users#login"
  get "logout", to: "users#logout"
  get "users", to: "users#index"
  post "users/delete", to: "users#delete"
  get "users/:id", to: "users#show"
  post "login", to: "users#accept"
  post "user/create", to: "users#create"
end
