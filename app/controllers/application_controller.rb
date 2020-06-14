class ApplicationController < ActionController::Base

  private
    def render_404
      render 'public/404'
    end
end
