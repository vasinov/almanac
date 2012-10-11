module Slate
  class PostsController < ApplicationController
    respond_to :html

    def index
      @blog = Slate::Blog.first
      @posts = (defined? current_user or !@blog.nil?) ? Slate::Post.all : nil

      respond_with(@posts) do |format|
        format.html
      end
    end
  end
end
