class TeamsController < ApplicationController
  # before_action :require_current_user
	# NEED TO REMOVE THIS SKIP
	skip_before_action :verify_authenticity_token

	def show
		@team = Team.find(params[:id])
		render '/teams/show.json.jbuilder'
	end

	def index
		@teams = Team.all
    render '/teams/index.json.jbuilder'
	end

  def create
		@team = Team.new(team_params)

		if @team.save
			render json: @team
		else
			render json: {
        error: {
          message: @team.errors.full_messages.to_sentence
        }
      }
		end
  end

	def update
		team_id = params[:id]
		@team = Team.find(team_id)
		if @team.update(team_params)
			render json: @team
		else
			render json: {
				error: {
					message: @team.errors.full_messages.to_sentence
				}
			}
		end
	end

	def destroy
		team_id = params[:id]
		@team = Team.find(team_id)

		if @team.destroy

		else
			render json: {
				error: {
					message: @team.errors.full_messages.to_sentence
				}
			}
		end
	end

  private

	def team_params
		params.require(:team).permit(:name, :description)
	end

end
