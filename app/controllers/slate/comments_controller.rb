require_dependency "slate/application_controller"

module Slate
  class CommentsController < ApplicationController
    load_and_authorize_resource class: Slate::Comment
    respond_to :html

    def create
      @comment = Comment.new(params[:comment])
      @post = Post.find(params[:post_id])

      @comment.post = @post

      respond_with(@comment) do |format|
        @comment.spam = (@blog.rakismet_key?) ? @comment.spam? : false

        if @comment.save
          format.html {
            redirect_to post_path(@comment.post),
                        :notice => (@comment.spam) ? "Your comment looks like spam, it won't be published." : "Comment was successfully posted."
          }
        else
          format.html { render :action => :back, :alert => 'Something went wrong, try again.' }
        end
      end
    end

    def destroy
      @post = Post.find(params[:post_id])
      @comment = Comment.find(params[:id])
      respond_to do |format|
        if @comment.destroy
          format.html { redirect_to post_path(@post), :notice => 'Post was successfully deleted.' }
        else
          format.html { redirect_to post_path(@post), :alert => 'Something went wrong, try again.' }
        end
      end
    end
  end
end
