class TodosController < ApplicationController

	# before_action :require_current_user

	# NEED TO REMOVE THIS SKIP
	skip_before_action :verify_authenticity_token

	def show
		todo_id = params[:id]
		@todo = Todo.find(todo_id)
	end

	def create
		@todo = current_user.todos.new(todo_params)

		if @todo.save
			render json: @todo
		else
			render json: {
        error: {
          message: @todo.errors.full_messages.to_sentence
        }
      }
		end
	end

	def update
		todo_id = params[:id]
		@todo = Todo.find(todo_id)
		if @todo.update(todo_params)
			render json: @todo
		else
			render json: {
        error: {
          message: @todo.errors.full_messages.to_sentence
        }
      }
		end
	end

	def index
		user = current_user
		@todos = user.todos
		@team_todos = user.team_todos
	end

	def destroy
		todo_id = params[:id]
		@todo = Todo.find(todo_id)

		if @todo.destroy
			
		else
			render json: {
				error: {
					message: @todo.errors.full_messages.to_sentence
				}
			}
		end
	end

	private

	def todo_params
		params.require(:todo).permit(:name, :description, :due_date, :done,
		:priority, :users, :teams)
	end
end
