class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def login
    render '/login'
  end

  def signup
    render  '/signup'
  end

  def angular
    render '/angular', layout: 'angular'
  end

  def frontpage
    render '/frontpage', layout: 'angular'
  end

  # Sending a GET request to /session will invoke this function and return
  # either the current user as a JSON object or 'false'.
  def logged_in?
    !!current_user
  end

  def require_current_user
    redirect_to root_path unless logged_in?
  end

  def welcome
  # Probably need to remove this route
  end

  private

  def current_user
    @current_user ||= session[:current_user_id] &&
    User.find(session[:current_user_id])
  end
end
