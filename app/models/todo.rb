class Todo < ActiveRecord::Base
	has_many :users, as: :todo_assignment
	has_many :teams, as: :todo_assignment

	def find_users
		User.find_each do |user|
			user.todos.map do |todo|
				if todo.id == self.id
					user
				end
			end
		end
	end

	def find_teams
		Team.find_each do |team|
			team.todos.map do |todo|
				if todo.id == self.id
					team
				end
			end
		end
	end

end
