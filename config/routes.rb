Slate::Engine.routes.draw do
  root :to => "posts#index"
  match "new" => "blogs#new"
  resources :blogs
  resources :posts
end
