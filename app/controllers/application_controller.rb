class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	@current_user = User.last
  #   if session[:session_token]
  #     @current_user ||= User.find_by(session_token: session[:session_token])
  #   else
  #     @current_user = nil
  #   end
  end
end
