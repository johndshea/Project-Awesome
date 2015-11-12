class Todo < ActiveRecord::Base
	has_many :todo_assignments
	has_many :users, through: :todo_assignments, source: :assignable, source_type: 'User'
	has_many :teams, through: :todo_assignments, source: :assignable, source_type: 'Team'

	validates :name, presence: true
	validates :due_date, presence: true
end
