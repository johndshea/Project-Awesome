class Todo < ActiveRecord::Base
	has_many :users, as: :todo_assignment
	has_many :teams, as: :todo_assignment

	def find_users
		User.find_each do |user|
			user.todos.map do |todo|
				if todo.id == self.id
					puts user
					user
				end
			end.inject(:+)
		end
	end

	def find_teams
		Team.find_each do |team|
			team.find_todos
			team.todos.map do |todo|
				if todo.id == self.id
					team
				end
			end.inject(:+)
		end
	end

end
