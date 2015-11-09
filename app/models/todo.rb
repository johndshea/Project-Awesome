class Todo < ActiveRecord::Base
	has_many :todo_assignments
	has_many :users, through: :todo_assignments

	validates :name, presence: true

	def find_users
		users = []
		User.find_each do |user|
			 user.todos.map do |todo|
				if todo.id == self.id
					users.push(user)
				end
			end.inject(:+)
		end
		return users
	end

	def find_teams
		teams = []
		Team.find_each do |team|
			team.find_todos
			team.todos.map do |todo|
				if todo.id == self.id
					teams.push(team)
				end
			end.inject(:+)
		end
	end

end
