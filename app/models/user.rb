class User < ActiveRecord::Base
  has_many :user_teams
  has_many :teams, through: :user_teams
  has_many :todos, as: :todo_assignment

  def team_todos
  	self.teams.map do |team|
  		team.todos
  	end.inject(:+)
  end
end