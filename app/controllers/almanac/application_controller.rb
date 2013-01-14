module Almanac
  class ApplicationController < ActionController::Base
    protect_from_forgery

    before_filter :set_current_author
    before_filter :set_blog

    before_filter do |controller|
      @kramdown_parser = KramdownParser.new
    end

    def set_current_author
      current_user ||= nil
    end

    def set_blog
      @blog = Almanac::Blog.first
    end
  end
end
