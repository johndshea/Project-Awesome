class User < ActiveRecord::Base
  has_many :user_teams
  has_many :teams, through: :user_teams
end
