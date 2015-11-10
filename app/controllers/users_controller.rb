class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:message] = "user created"
    else
      flash[:message] = @user.errors.full_messages.to_sentence
    end

    redirect_to root_path
  end

  def show
		@user = User.find(params[:id])
		render '/users/show.json.jbuilder'
  end

  def index
		@users = User.all
    render '/users/index.json.jbuilder'
  end

  private

  def user_params
    return params.require(:user).permit(:username, :password)
  end
end
