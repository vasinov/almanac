Almanac::Engine.routes.draw do
  root :to => "posts#index"

  get "new_blog"  => "blogs#new",  :as => "new_blog"
  get "edit_blog" => "blogs#edit", :as => "edit_blog"

  resources :blogs

  resources :comments do
    collection do
      get "spam" => "comments#spam"
    end
  end

  get    "posts.rss"  => "posts#index",   :format => "rss"
  get    "feed.rss"   => "posts#index",   :format => "rss"
  get    "drafts/:id" => "posts#draft",   :as     => "draft"
  get    ":id/edit"   => "posts#edit"
  get    "new_post"   => "posts#new"
  get    ":slug"      => "posts#show"
  post   "posts"      => "posts#create"
  put    ":id"        => "posts#update"
  put    "posts"      => "posts#update"
  delete ":id"        => "posts#destroy"

  resources :posts do
    resources :images
    resources :comments
  end
  get 'tags/:tag_name', :to => "posts#tag", :as => "tag"
end
