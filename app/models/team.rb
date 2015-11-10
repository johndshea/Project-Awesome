class Team < ActiveRecord::Base
  has_many :user_teams
  has_many :users, through: :user_teams
  has_many :todo_assignments, as: :assignable
  has_many :todos, through: :todo_assignments

  validates :name, presence: true, uniqueness: true
end
