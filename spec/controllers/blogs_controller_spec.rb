require 'spec_helper'

describe Slate::BlogsController do
  describe "POST create" do
    context "with valid attributes" do
      it "creates a new blog" do
        user = create(:user)
        sign_in = sign_in user
        Slate::ApplicationController.send(:define_method, :current_user) do
          user
        end

        #expect{
        #  post :create, { :use_route => :slate }, blog: attributes_for(:blog)
        #}.to change(Slate::Blog.all, :count).by(1)

        post :create, { :use_route => :slate }, blog: attributes_for(:blog)
        expect(Slate::Blog.all.count).to eq 1
      end
    end

  end
end