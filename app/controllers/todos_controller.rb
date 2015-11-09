class TodosController < ApplicationController
	before_action :require_current_user
	# NEED TO REMOVE THIS SKIP 
	skip_before_action :verify_authenticity_token

	def create
		@todo = current_user.todos.new(todo_params)

		if @todo.save
			redirect_to todos_path
		else
			render json: {
        error: {
          message: @todo.errors.full_messages.to_sentence
        }
      }
		end
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
