module Slate
  class ApplicationController < ActionController::Base
    protect_from_forgery

    before_filter :set_current_author

    def set_current_author
      @current_author = (current_user.nil?) ? nil : current_user
    end
  end
end
