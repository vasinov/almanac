require_dependency "slate/application_controller"

module Slate
  class BlogsController < ApplicationController
    load_and_authorize_resource class: Slate::Blog
    respond_to :html

    before_filter :only => [:show, :edit, :update, :delete] do |controller|
      @blog = Blog.find(params[:id])
    end

    def new
      @blog = (!Blog.first.nil?) ? Blog.first : Blog.new

      respond_with(@blog) do |format|
        if @blog.id
          format.html { redirect_to :root, :notice => 'You can only have one blog.' }
        else
          format.html
        end
      end
    end

    def create
      @blog = (!Blog.first.nil?) ? Blog.first : Blog.new(params[:blog])
      @blog.author = @current_author

      respond_with(@blog) do |format|
        if @blog.id
          if @blog.save
            format.html { redirect_to :root, :notice => 'Blog was successfully created.' }
          else
            format.html { render :action => "new", :alert => 'Something went wrong, try again.' }
          end
        else
          format.html { redirect_to :root, :notice => 'You can only have one blog.' }
        end
      end
    end

    def edit
      respond_to do |format|
        format.html
      end
    end

    def update
      respond_with(@blog) do |format|
        if @blog.update_attributes(params[:blog])
          format.html { redirect_to :root, :notice => 'Blog was successfully updated.' }
        else
          format.html { render :action => "edit" }
        end
      end
    end

    def spam
      @comments = Comment.spam

      respond_with(@comments) do |format|
      end
    end
  end
end
