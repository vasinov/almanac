require 'spec_helper'

describe Almanac::BlogsController do
  describe "POST create" do
    context "with valid attributes" do
      it "creates a new blog" do
        expect{
          post :create, :use_route => :almanac, blog: attributes_for(:blog, :author_id => nil)
        }.to change(Almanac::Blog, :count).by(1)

      end

      it "redirects to the site root" do
        post :create, :use_route => :almanac, blog: attributes_for(:blog, :author_id => nil)
        response.should redirect_to root_url
      end
    end
    context "with invalid attributes" do
      it "doesn't create a new blog" do
        expect{
          post :create, :use_route => :almanac, blog: attributes_for(:blog, :title => nil, :author_id => nil)
        }.to_not change(Almanac::Blog, :count)

      end

      it "re-renders the new method" do
        post :create, :use_route => :almanac, blog: attributes_for(:blog, :title => nil, :author_id => nil)
        response.should render_template :new
      end
    end
  end

  describe "PUT update" do
    before :each do
      @blog = create(:blog)
    end
    context "with valid attributes" do
      it "changes blog's attributes" do
        put :update, id: @blog.id, :use_route => :almanac,
            blog: attributes_for(:blog, title: "Testz")
        @blog.reload
        @blog.title.should eq("Testz")
      end
      it "redirects to the site root" do
        put :update, :use_route => :almanac, id: @blog.id, blog: attributes_for(:blog)
        response.should redirect_to root_url
      end
    end
    context "with invalid attributes" do
      it "doesn't change blog's attributes" do
        old_title = @blog.title
        put :update, id: @blog.id, :use_route => :almanac,
            blog: attributes_for(:blog, title: nil)
        @blog.reload
        @blog.title.should eq(old_title)
      end
      it "re-renders the edit method" do
        put :update, id: @blog.id, :use_route => :almanac,
            blog: attributes_for(:blog, title: nil)
        response.should render_template :edit
      end
    end
  end
end