module Slate
  class PostsController < ApplicationController
    respond_to :html

    def index
      @posts = (defined? current_user) ? "posts" : nil

      respond_with(@posts) do |format|
        if @posts.nil?
          flash.now[:alert] = 'current_user is not found. Check your Devise setup.'
          format.html
        else
          format.html
        end
      end
    end
  end
end
