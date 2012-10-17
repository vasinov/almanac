Slate::Engine.routes.draw do
  root :to => "posts#index"
  match "new" => "blogs#new"
  resources :blogs
  resources :images
  resources :posts do
    resources :images
  end
end
