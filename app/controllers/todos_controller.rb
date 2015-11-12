class TodosController < ApplicationController
	# before_action :require_current_user

	# NEED TO REMOVE THIS SKIP
	# skip_before_action :verify_authenticity_token

	# View all todos belonging to the current user and to any teams the current user belongs to.
	# Returns a JSON object containing two an arrays of todos.
	def index
		user = current_user
		@todos = user.todos
		@team_todos = user.team_todos
	end

	# Create a todo. Accepts a JSON object and returns the created Todo object.
	def create
		puts current_user
		@todo = current_user.todos.new(todo_params)
		@todo.users.push(current_user);

		if @todo.save
			render json: @todo
			puts 'SAVVVVVVEEEEDD ', @todo.users

		else
			render json: {
				error: {
					message: @todo.errors.full_messages.to_sentence
				}
			}
		end
	end

	# View an individual todo. Returns a JSON object.
	def show
		todo_id = params[:id]
		@todo = Todo.find(todo_id)
	end

	# Modify a todo. Accepts a JSON object and returns the modified Todo object.
	def update
		todo_id = params[:id]
		@todo = Todo.find(todo_id)
		todo_params[:users].each do |user|
			found_user = User.find(user.id)
			found_user.todos.each do |todo|
				if todo.id = @todo.id
					puts "already exists"
					break
				else
					
				end
			end
		end
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

	# Delete a todo. Accepts a JSON object and returns the modified Todo object.
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
