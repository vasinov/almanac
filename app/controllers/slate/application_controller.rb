module Slate
  class ApplicationController < ActionController::Base
    def set_current_author
      current_user = Slate.current_user.constantize
      if !current_user
        @current_author = nil
      else
        @current_author = current_user
      end
    end
  end
end
