class TeamsController < ApplicationController
  # before_action :require_current_user
	# NEED TO REMOVE THIS SKIP
	skip_before_action :verify_authenticity_token

	# View all teams. Returns a JSON object containing an array of teams.
	def index
		@teams = Team.all
		render '/teams/index.json.jbuilder'
	end

	# Create a team. Accepts a JSON object and returns the created Team object.
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

	# View an individual team. Returns a JSON object.
	def show
		@team = Team.find(params[:id])
		render '/teams/show.json.jbuilder'
	end

	# Modify a team. Accepts a JSON object and returns the modified Team object.
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

	# Delete a team.
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
