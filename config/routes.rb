Slate::Engine.routes.draw do
  root :to => "posts#index"
  match "new" => "blogs#new"
  resources :blogs
  resources :posts do
    resources :images
  end
  get 'tag/:tag_name', :to => "posts#tag", :as => "tag"
end
