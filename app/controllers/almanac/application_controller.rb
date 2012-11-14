module Almanac
  class ApplicationController < ActionController::Base
    protect_from_forgery

    before_filter :set_current_author
    before_filter :set_blog

    before_filter do |controller|
      @markdown_parser = MarkdownParser.new
    end

    def set_current_author
      current_user ||= nil
    end

    def set_blog
      @blog = Almanac::Blog.first
      unless @blog.nil?
        Rakismet.key = (@blog.rakismet_key) ? @blog.rakismet_key : ''
        Rakismet.url = (@blog.rakismet_url) ? @blog.rakismet_url : ''
      end
    end
  end
end
