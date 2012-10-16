require_dependency "slate/application_controller"

module Slate
  class PostsController < ApplicationController
    load_and_authorize_resource class: Slate::Post
    respond_to :html
    before_filter :find_post, :only => [:show, :edit, :update, :delete]

    def index
      @blog = Slate::Blog.first
      @posts = (!@blog.nil?) ? Slate::Post.order("id DESC").all : nil

      respond_with(@posts) do |format|
        if @blog.nil?
          unless @current_author.nil?
            format.html { redirect_to new_path }
          end
        else
          format.html
        end
      end
    end

    def show
      respond_with(@post) do |format|
        format.html
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
      @post.blog = Slate::Blog.first
      @post.author_id = current_user.id

      respond_with(@post) do |format|
        if @post.save
          format.html { redirect_to posts_path, :notice => 'Post was successfully created.' }
        else
          format.html { render :action => "new", :alert => 'Something went wrong, try again.' }
        end
      end
    end

    def edit
      @post.body = MarkdownParser.html_to_markdown(@post.body)
      respond_to do |format|
        format.html
      end
    end

    def update
      @post.blog = Slate::Blog.first

      respond_with(@post) do |format|
        if @post.update_attributes(params[:post])

          format.html { redirect_to post_path(@post), :notice => 'Post was successfully updated.' }
        else
          format.html { render :action => "edit" }
        end
      end
    end

    def destroy
      post_id = @post.id
      respond_to do |format|
        if @post.destroy
          format.html { redirect_to posts_path, :notice => 'Post was successfully deleted.' }
        else
          format.html { redirect_to post_path(@post), :alert => 'Something went wrong, try again.' }
        end
      end
    end

    private
    def find_post
      @post = Post.find(params[:id])
    end
  end
end
