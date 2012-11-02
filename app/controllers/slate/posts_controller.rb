require_dependency "slate/application_controller"

module Slate
  class PostsController < ApplicationController
    load_and_authorize_resource class: Slate::Post
    respond_to :html
    before_filter :only => [:show, :edit, :update, :delete] do |controller|
      @post = Post.find(params[:id])
    end
    before_filter :only => [:index, :show, :tag] do |controller|
      @markdown_parser = MarkdownParser.new
    end
    before_filter :only => [:show] do |controller|
      if @post.published
        @comments = @post.comments.where(:spam => false)
      end
    end

    def index
      @posts = (@blog.nil?) ? [] : Post.recent(params)
      @drafts = (@blog.nil? or @current_author.nil?) ? [] : Post.drafts(params)

      respond_with(@posts) do |format|
        if @blog.nil?
          unless @current_author.nil?
            format.html { redirect_to new_path }
          end
        else
          format.html
          format.rss { render :layout => false }
        end
      end
    end

    def tag
      @posts = (@blog.nil?) ? [] : Post.tagged(params)
      @tag = params[:tag_name]

      respond_with(@posts) do |format|
        if @blog.nil?
          unless @current_author.nil?
            format.html { redirect_to new_path }
          end
        else
          format.html
          format.rss { render :layout => false }
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
      @post.id = 0
      @images = @post.images

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
          format.html { redirect_to :root, :notice => 'Post was successfully created.' }
        else
          format.html { render :action => "new", :alert => 'Something went wrong, try again.' }
        end
      end
    end

    def edit
      respond_to do |format|
        format.html
      end
    end

    def update
      @post.blog = Slate::Blog.first

      respond_with(@post) do |format|
        if @post.update_attributes(params[:post])

          format.html { redirect_to :root, :notice => 'Post was successfully updated.' }
        else
          format.html { render :action => "edit" }
        end
      end
    end

    def destroy
      post_id = @post.id
      respond_to do |format|
        if @post.destroy
          format.html { redirect_to :root, :notice => 'Post was successfully deleted.' }
        else
          format.html { redirect_to post_path(@post), :alert => 'Something went wrong, try again.' }
        end
      end
    end
  end
end
