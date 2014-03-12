require_dependency "almanac/application_controller"

module Almanac
  class ImagesController < ApplicationController
    load_and_authorize_resource class: Almanac::Image
    respond_to :html

    before_filter :only => [:delete] do |controller|
      @image = Image.find(params[:id])
      @post = Post.find(params[:post_id])
    end

    def create
      @blog = Almanac::Blog.first
      @image = Image.new(image_params)

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
          format.html { redirect_to :back, :alert => 'Something went wrong, try again.' }
        end
      end
    end

    def destroy
      image_id = @image.id
      respond_to do |format|
        if @image.destroy
          format.html { redirect_to :root, :notice => 'Image was successfully deleted.' }
          format.js { render :nothing => true }
        else
          format.html { redirect_to post_path(@post), :alert => 'Something went wrong, try again.' }
        end
      end
    end

    protected

    def image_params
      params.require(:image).permit(:image, :thumb, :post_id)
    end
  end
end
