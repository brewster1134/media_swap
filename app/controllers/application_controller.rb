class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  after_action :verify_authorized, unless: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def default_url_options
    { host: request.host_with_port }
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to do that.'
    redirect_to root_path
  end
end
