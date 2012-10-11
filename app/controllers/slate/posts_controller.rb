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
  end
end
