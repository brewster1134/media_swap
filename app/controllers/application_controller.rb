class ApplicationController < ActionController::Base
  def default_url_options
    { host: request.host_with_port }
  end
end
