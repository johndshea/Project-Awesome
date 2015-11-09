class User < ActiveRecord::Base
  has_secure_password

  has_many :user_teams
  has_many :teams, through: :user_teams

  has_many :todo_assignments, as: :assignable
  has_many :todos, through: :todo_assignments

  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true

  validates :password, length: {
    minimum: 8, allow_nil: true
  }

  def team_todos
  	self.teams.map do |team|
  		team.todos
  	end.inject(:+)
  end
end
