Almanac::Engine.routes.draw do
  root :to => "posts#index"

  match "new_blog" => "blogs#new", :as => "new_blog"
  match "edit_blog" => "blogs#edit", :as => "edit_blog"

  resources :blogs

  resources :comments do
    collection do
      get "spam" => "comments#spam"
    end
  end

  match "posts.rss" => "posts#index", :format => "rss"
  match "feed.rss" => "posts#index", :format => "rss"
  match ":id/edit" => "posts#edit", :as => "edit_post"
  match "new_post" => "posts#new", :as => "new_post"
  match "drafts/:id" => "posts#draft", :as => "draft", :via => :get
  match ":slug" => "posts#show", :as => "post", :via => :get
  match "posts" => "posts#create", :as => "posts", :via => :post
  match ":id" => "posts#update", :as => "posts", :via => :put
  match "posts" => "posts#update", :as => "posts", :via => :put
  match ":id" => "posts#destroy", :as => "post", :via => :delete
  resources :posts do
    resources :images
    resources :comments
  end
  get 'tags/:tag_name', :to => "posts#tag", :as => "tag"
end
