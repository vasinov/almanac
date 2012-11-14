Almanac::Engine.routes.draw do
  root :to => "posts#index"

  match "new_blog" => "blogs#new", :as => "new_blog"
  resources :blogs do
    member do
      get "spam" => "blogs#spam"
    end
  end

  match "posts" => "posts#index"
  match ":id/edit" => "posts#edit", :as => "edit_post"
  match "new" => "posts#new", :as => "new_post"
  match ":id" => "posts#show", :as => "post", :via => :get
  match ":id" => "posts#create", :as => "post", :via => :post
  match ":id" => "posts#update", :as => "post", :via => :put
  match ":id" => "posts#destroy", :as => "post", :via => :delete
  resources :posts do
    resources :images
    resources :comments
  end
  get 'tags/:tag_name', :to => "posts#tag", :as => "tag"
end
