require 'spec_helper'

describe Almanac::CommentsController do
  before :each do
    @post = create(:post)
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new comment" do
        expect{
          post :create, :use_route => :almanac, comment: attributes_for(:comment), :post_id => @post.id
        }.to change(Almanac::Comment, :count).by(1)
      end

      it "redirects to the post" do
        post :create, :use_route => :almanac, comment: attributes_for(:comment), :post_id => @post.id
        response.should redirect_to @post
      end
    end
    context "with invalid attributes" do
      it "doesn't create a new comment" do
        expect{
          post :create, :use_route => :almanac, comment: attributes_for(:comment, :body => nil), :post_id => @post.id
        }.to_not change(Almanac::Comment, :count)
      end

      it "redirects to the post" do
        post :create, :use_route => :almanac, comment: attributes_for(:comment), :post_id => @post.id
        response.should redirect_to @post
      end
    end
  end

  describe "DELETE destroy" do
    before :each do
      @comment = create(:comment, :post_id => @post.id)
    end

    it "deletes the comment" do
      expect{
        delete :destroy, :use_route => :almanac, id: @comment.id, :post_id => @post.id
      }.to change(Almanac::Comment, :count).by(-1)
    end

    it "redirects to the post" do
      delete :destroy, :use_route => :almanac, id: @comment.id, :post_id => @post.id
      response.should redirect_to @post
    end
  end

  describe "GET spam" do
    before :each do
      post = create(:post_with_comments, comments_count: 10, blog_id: @post.blog.id)
      @spam_comments = create_list(:spam_comment, 5, post_id: post.id)
    end
    it "returns spam comments" do
      get :spam, :use_route => :almanac, id: @post.blog.id
      assigns(:comments).should eq(@spam_comments)
    end
    it "renders the spam page" do
      get :spam, :use_route => :almanac, id: @post.blog.id
      response.should render_template :spam
    end
  end
end