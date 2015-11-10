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

  def update
		user_id = params[:id]
		@user = User.find(user_id)
		if @user.update(user_params)
			render json: @user
		else
			render json: {
				error: {
					message: @user.errors.full_messages.to_sentence
				}
			}
		end
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
