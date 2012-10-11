Slate::Engine.routes.draw do
  root :to => "posts#index"
  resources :blogs
end
