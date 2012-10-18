require_dependency "slate/application_controller"

module Slate
  class ImagesController < ApplicationController
    load_and_authorize_resource class: Slate::Image
    respond_to :html, :json

    def create
      @image = Image.new(params[:image])
      @image.post = Post.find(params[:post_id])

      respond_with(@image) do |format|
        if @image.save
          format.html { redirect_to :back, :notice => 'Image was successfully created.' }
        else
          format.html { render :action => :back, :alert => 'Something went wrong, try again.' }
        end
      end
    end
  end
end
