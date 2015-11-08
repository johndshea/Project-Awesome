class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def welcome
  # NEED TO ADD CODE SO:  if session exists, redirect to todo page, else, render login page
  end

  private

  def current_user
    # @current_user = User.last
    @current_user ||= session[:current_user_id] &&
    User.find(session[:current_user_id])
    # if session[:session_token]
    #   @current_user ||= User.find_by(session_token: session[:session_token])
    # else
    #   @current_user = nil
    # end
  end
end
