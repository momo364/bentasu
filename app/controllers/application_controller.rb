class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_worker
    Worker.find_by(id: session[:worker_id]) if session[:worker_id]
  end
  helper_method :current_worker
end
