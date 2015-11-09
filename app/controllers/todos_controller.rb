class TodosController < ApplicationController
	before_action :require_current_user

	def create
		current_user.todos.new(todo_params)
	end

	def update
	end

	def index
		user = User.last
		@todos = user.todos
		@team_todos = user.team_todos
	end

	def delete

	end
	private

	def todo_params
		params.require(:todo).permit(:name, :description, :due_date, :done,
		:priority, :users, :teams)
	end
end
