class Todo < ActiveRecord::Base
	has_many :users, as: :todo_assignment
	has_many :teams, as: :todo_assignment
end
