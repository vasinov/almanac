require_dependency "slate/application_controller"

module Slate
  class PostsController < ApplicationController
    respond_to :html

    def index
      @blog = Slate::Blog.first
      @posts = (!@blog.nil?) ? Slate::Post.all : nil

      respond_with(@posts) do |format|
        if @blog.nil?
          if !@current_author.nil?
            format.html { redirect_to new_path }
          end
        else
          format.html
        end
      end
    end

    def new
      @post = Post.new

      respond_with(@post) do |format|
        format.html
      end
    end

    def create
      @post = Post.new(params[:post])

      respond_with(@post) do |format|
        if @post.save
          format.html { redirect_to posts_path, :notice => 'Post was successfully created.' }
        else
          format.html { render :action => "new", :alert => 'Something went wrong, try again.' }
        end
      end
    end
  end
end
