require_dependency "almanac/application_controller"

module Almanac
  class BlogsController < ApplicationController
    load_and_authorize_resource class: Almanac::Blog
    respond_to :html

    before_filter :only => [:show, :update, :delete] do |controller|
      @blog = Blog.find(params[:id])
    end

    def new
      @blog = (Blog.first.nil?) ? Blog.new : Blog.first

      respond_with(@blog) do |format|
        if @blog.id
          format.html { redirect_to :root, :notice => 'You can only have one blog.' }
        else
          format.html
        end
      end
    end

    def create
      @blog = (Blog.first.nil?) ? Blog.new(blog_params) : Blog.first
      @blog.author_id = current_user.id

      respond_with(@blog) do |format|
        if Blog.first.nil?
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
      @blog = Blog.first

      respond_to do |format|
        format.html
      end
    end

    def update
      respond_with(@blog) do |format|
        if @blog.update_attributes(blog_params)
          format.html { redirect_to :root, :notice => 'Blog was successfully updated.' }
        else
          format.html { render :action => "edit" }
        end
      end
    end

    protected

    def blog_params
      params.require(:blog).permit(:title, :description, :author_id, :logo, :background, :retained_logo,
                                   :retained_background, :google_analytics, :twitter, :background_tile,
                                   :background_blur, :footer, :disqus_shortname)
    end
  end
end
