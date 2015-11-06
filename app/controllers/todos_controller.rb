class TodosController < ApplicationController
	def index
		john = User.last
		@todos = john.todos
		@team_todos = john.team_todos
	end
end
