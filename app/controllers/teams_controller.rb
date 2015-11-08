class TeamsController < ApplicationController

  def index
		@teams = Team.all
    render '/teams/index.json.jbuilder'
  end
end
