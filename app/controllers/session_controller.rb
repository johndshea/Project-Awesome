class SessionController < ApplicationController
  def login
  end

  def create
    user = User.find_by(username: user_params[:username])

    if user && user.authenticate(user_params[:password])
      session[:current_user_id] = user.id
      flash[:message] = "thanks for logging in"
      redirect_to root_path
    else
      flash[:message] = "email/password combination does not exist"
      redirect_to root_path
    end
  end

  def logged_in_user
    render json: current_user
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    return params.require(:user).permit(:username, :password)
  end
end
