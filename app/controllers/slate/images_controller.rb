require_dependency "slate/application_controller"

module Slate
  class ImagesController < ApplicationController
    load_and_authorize_resource class: Slate::Image
    respond_to :html

    def create
      @blog = Slate::Blog.first
      @image = Image.new(params[:image])

      if params[:post_id] == "0"
        @post = Post.create( { :published => false, :author_id => current_user.id, :blog_id =>  @blog.id } )
      else
        @post = Post.find(params[:post_id])
      end

      @image.post = @post

      respond_with(@image) do |format|
        if @image.save
          format.html { redirect_to edit_post_path(@image.post), :notice => 'Image was successfully created.' }
        else
          format.html { render :action => :back, :alert => 'Something went wrong, try again.' }
        end
      end
    end
  end
end
