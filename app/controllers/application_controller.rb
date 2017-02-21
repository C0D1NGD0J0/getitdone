class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from(AbstractController::ActionNotFound) do
    flash.now[:error] = 'Action Not FOund'
    render root_url
  end

  # rescue_from AbstractController::ActionNotFound, with: -> { render_404  }
  # rescue_from AbstractController::ActionNotFound, with: :render_404

  # def render_404
  # 	puts "INSIDE render_404" * 10
  #   respond_to do |format|
  #     format.html { render template: 'errors/not_found', status: 404 }
  #   end
  # end
end
