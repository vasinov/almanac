module Slate
  class ApplicationController < ActionController::Base
    protect_from_forgery

    before_filter :set_current_author

    def set_current_author
      if !current_user
        @current_author = nil
      else
        @current_author = current_user
      end
    end
  end
end
