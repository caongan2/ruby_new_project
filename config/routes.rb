Rails.application.routes.draw do
  resources :posts
  get 'posts/delete/:id', to: "posts#destroy"
  post 'post/update/:id', to: "posts#update"
  post 'comments/create', to: "comments#create", as: :create
  get 'comments/delete/:id', to: "comments#destroy"
end
