module Slate
  class ApplicationController < ActionController::Base
    protect_from_forgery

    before_filter :set_current_author
    before_filter :set_blog

    def set_current_author
      @current_author = (current_user.nil?) ? nil : current_user
    end

    def set_blog
      @blog = Slate::Blog.first
      unless @blog.nil?
        Rakismet.key = (@blog.rakismet_key) ? @blog.rakismet_key : ''
        Rakismet.url = (@blog.rakismet_url) ? @blog.rakismet_url : ''
      end
    end
  end
end
