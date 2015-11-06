class Team < ActiveRecord::Base
  has_many :user_teams
  has_many :users, through: :user_teams
  has_many :todos, as: :todo_assignment
end
