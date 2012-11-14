require 'spec_helper'

describe Almanac::PostsController do
  before :each do
    @blog = create(:blog)
  end

  describe "GET index" do
    it "populates an array of posts" do
      posts_count = 5
      posts = create_list(:post, posts_count, blog_id: @blog.id)
      get :index, :use_route => :almanac
      assigns(:posts).should eq posts.reverse
    end

    it "populates an array of drafts" do
      drafts_count = 3
      drafts = create_list(:post_draft, drafts_count, blog_id: @blog.id)
      get :index, :use_route => :almanac
      assigns(:drafts).should eq drafts.reverse
    end

    it "renders the :index view" do
      get :index, :use_route => :almanac
      response.should render_template :index
    end
  end

  describe "GET tag" do
    it "populates an array of tagged posts" do
      posts_count = 5
      posts = create_list(:post, posts_count, blog_id: @blog.id)
      get :tag, :use_route => :almanac, :tag_name => "common"
      assigns(:posts).should eq posts.reverse
    end

    it "renders the :tag view" do
      get :tag, :use_route => :almanac
      response.should render_template :tag
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new post" do
        expect{
          post :create, :use_route => :almanac, post: attributes_for(:post, :blog_id => @blog.id)
        }.to change(Almanac::Post, :count).by(1)
      end

      it "redirects to the site root" do
        post :create, :use_route => :almanac, post: attributes_for(:post, :blog_id => @blog.id)
        response.should redirect_to root_url
      end
    end
    context "with invalid attributes" do
      it "doesn't create a new post" do
        expect{
          post :create, :use_route => :almanac, post: attributes_for(:post, :title => nil, :blog_id => @blog.id)
        }.to_not change(Almanac::Post, :count)
      end

      it "re-renders the new method" do
        post :create, :use_route => :almanac, post: attributes_for(:post, :title => nil, :blog_id => @blog.id)
        response.should render_template :new
      end
    end
  end

  describe "PUT update" do
    before :each do
      @post = create(:post, :blog_id => @blog.id)
    end

    context "with valid attributes" do
      it "changes blog's attributes" do
        put :update, id: @post.id, :use_route => :almanac,
            post: attributes_for(:post, title: "Testz")
        @post.reload
        @post.title.should eq("Testz")
      end

      it "redirects to the site root" do
        put :update, :use_route => :almanac, id: @post.id, post: attributes_for(:post)
        response.should redirect_to root_url
      end
    end
    context "with invalid attributes" do
      it "doesn't change post's attributes" do
        old_title = @post.title
        put :update, id: @post.id, :use_route => :almanac,
            post: attributes_for(:post, title: nil)
        @post.reload
        @post.title.should eq(old_title)
      end
      it "re-renders the edit method" do
        put :update, id: @post.id, :use_route => :almanac,
            post: attributes_for(:post, title: nil)
        response.should render_template :edit
      end
    end
  end

  describe "DELETE destroy" do
    before :each do
      @post = create(:post, :blog_id => @blog.id)
    end

    it "deletes the post" do
      expect{
        delete :destroy, :use_route => :almanac, id: @post.id
      }.to change(Almanac::Post, :count).by(-1)
    end

    it "redirects to the site root" do
      delete :destroy, :use_route => :almanac, id: @post
      response.should redirect_to root_url
    end
  end
end