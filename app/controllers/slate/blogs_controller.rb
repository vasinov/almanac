require_dependency "slate/application_controller"

module Slate
  class BlogsController < ApplicationController
    respond_to :html

    def new
      @business = @current_author.businesses.new

      respond_with(@business) do |format|
        format.html
      end
    end
  end
end
