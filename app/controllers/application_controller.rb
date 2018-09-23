class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  before_action :set_current_user

  def set_current_user
    User.current_user = current_user
  end

  def default_url_options
    { host: request.host_with_port }
  end
end
