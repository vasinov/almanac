Almanac::Engine.routes.draw do
  root :to => "posts#index"

  match "new_blog" => "blogs#new", :as => "new_blog"
  resources :blogs do
    member do
      get "spam" => "blogs#spam"
    end
  end

  #match "feed" => "posts#index", :format => "rss"
  #match ":id/edit" => "posts#edit", :as => "edit_post"
  #match "new" => "posts#new", :as => "new_post"
  #match "drafts/:id" => "posts#draft", :as => "draft", :via => :get
  #match ":slug" => "posts#show", :as => "post", :via => :get
  #match "posts" => "posts#create", :as => "posts", :via => :post
  #match ":id/edit" => "posts#update", :as => "posts", :via => :put
  #match ":id" => "posts#destroy", :as => "post", :via => :delete
  resources :posts, :path => '' do
    member do
      get "drafts/:id" => "posts#draft", :as => "draft", :via => :get
    end
    resources :images
    resources :comments
  end
  get 'tags/:tag_name', :to => "posts#tag", :as => "tag"
end
