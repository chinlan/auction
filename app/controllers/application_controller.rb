class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError do
    render file: "#{Rails.root.to_s}/public/403.html", status: :forbidden
  end

  # rescue_from StandardError do
  #   logger.error = 'StandardError occurs'
  #   redirect_to root_path
  # end
end
