class UsersController < ApplicationController
  # View all users. Returns a JSON object containing an array of Users.
  def index
    @users = User.all
    render '/users/index.json.jbuilder'
  end

  # Create a user. Accepts a JSON object and returns the created User object.
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:message] = "user created"
      session[:current_user_id] = @user.id
      flash[:message] = "thanks for logging in"
      redirect_to application_angular_path
    else
      flash[:message] = @user.errors.full_messages.to_sentence
      redirect_to root_path
    end
  end

  # View an individual user. Returns a JSON object.
  def show
		@user = User.find(params[:id])
		render '/users/show.json.jbuilder'
  end

  # Modify a user. Accepts a JSON object and returns the modified User object.
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

  # We do not have a destroy method for users. Do we want one? Probably not necessary.

  private

  def user_params
    return params.require(:user).permit(:username, :password)
  end
end
