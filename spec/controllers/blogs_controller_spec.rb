require 'spec_helper'

describe Slate::BlogsController do
  describe "POST create" do
    context "with valid attributes" do
      it "creates a new blog" do
        expect{
          post :create, :use_route => :slate, blog: attributes_for(:blog, :author_id => nil)
        }.to change(Slate::Blog, :count).by(1)

      end

      it "redirects to the site root" do
        post :create, :use_route => :slate, blog: attributes_for(:blog, :author_id => nil)
        response.should redirect_to root_url
      end
    end

  end
end