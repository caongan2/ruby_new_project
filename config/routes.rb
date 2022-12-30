Rails.application.routes.draw do
  resources :posts
  get 'posts/delete/:id', to: "posts#destroy"
  post 'post/update/:id', to: "posts#update"
  post 'comments/create', to: "comments#create", as: :create
  get 'comments/delete/:id', to: "comments#destroy"
  get "sing-up", to: "users#new"
  get "login", to: "users#login"
  get "logout", to: "users#logout"
  get "users", to: "users#index"
  post "login", to: "users#accept"
  post "user/create", to: "users#create"
end
